import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/adapters/services/formatters/date_formatter_service_adapter.dart';
import 'package:portox_app/app/commons/adapters/storage/external_storage_adapter.dart';
import 'package:portox_app/app/commons/domain/checklist_entity.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';

class FirebaseAdapter implements IExternalStorageAdapter {
  FirebaseAdapter({
    required FirebaseFirestore firestore,
    required IDateServiceAdapter dateFormatter,
  })  : _firestore = firestore,
        _dateFormatter = dateFormatter;
  final FirebaseFirestore _firestore;
  final IDateServiceAdapter _dateFormatter;
  static const _schedulesCollection = 'schedules';

  @override
  StreamSubscription loadSchedules(
    Function(List<ScheduleEntity>) onListenChange, {
    int? limit,
    List<String>? plantCodes,
  }) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final finalDay = DateTime(now.year, now.month, now.day + 5);

    return _firestore
        .collection(_schedulesCollection)
        .where('windowTimesTamp', isGreaterThanOrEqualTo: today)
        .where('windowTimesTamp', isLessThan: finalDay)
        .where('plantCode', whereIn: plantCodes)
        .limit(limit ?? 1000)
        .orderBy('windowTimesTamp')
        .snapshots(includeMetadataChanges: true)
        .listen((querySnapshot) async {
      final list = <ScheduleEntity>[];
      for (final doc in querySnapshot.docs) {
        final scheduleAdapt = await _adaptSchedule(doc.data());
        final schedule =
            await ScheduleEntity.fromFirebaseMap(doc.id, scheduleAdapt);

        list.add(schedule!);
      }
      debugPrint('LoadSchedules - onListenChange: ${DateTime.now()}');
      onListenChange(list);
    });
  }

  Future<Map<String, dynamic>> _adaptSchedule(Map<String, dynamic> map) async {
    final window = _dateFormatter.timestampToDate(map['windowTimesTamp']);
    final lines = <LineEntity>[];
    for (final Map<String, dynamic> line in map['lines']) {
      lines.add(LineEntity.fromFirebaseMap(line)!);
    }
    map['windows_date'] = window;
    map['windows_hour_minute'] = _dateFormatter.formatHourMinute(window);
    map['lineList'] = lines;
    return map;
  }

  @override
  Future<void> createChecklist(ChecklistEntity checklist) async {
    await _firestore.collection('schedule_checklists').add(checklist.toMap());
  }

  @override
  Future<void> createOccurrence(OccurrenceEntity occurrence) async {
    await _firestore.collection('occurrence').add(occurrence.toMap());
  }
}
