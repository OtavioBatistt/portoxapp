import 'dart:async';

import 'package:portox_app/app/commons/domain/checklist_entity.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

abstract class IExternalStorageAdapter {
  Future<void> createOccurrence(OccurrenceEntity occurrence);
  Future<void> createChecklist(ChecklistEntity checklist);
  StreamSubscription loadSchedules(
    Function(List<ScheduleEntity>) onListenChange, {
    int? limit,
    List<String>? plantCodes,
  });
}
