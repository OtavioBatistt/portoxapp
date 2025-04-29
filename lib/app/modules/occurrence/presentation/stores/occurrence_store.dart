import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/commons/domain/occurrence_type_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/master_store.dart';
import 'package:portox_app/app/modules/occurrence/domain/usecases/create_occurrence.dart';
import 'package:portox_app/app/modules/occurrence/domain/usecases/filter_current_steps.dart';
import 'package:portox_app/app/modules/occurrence/domain/usecases/load_occurrence.dart';
import 'package:portox_app/app/modules/occurrence/domain/usecases/save_occurrence.dart';

part 'occurrence_store.g.dart';

class OccurrenceStore = OccurrenceStoreBase with _$OccurrenceStore;

enum OccurrenceStatus { initial, loading, success, error }

abstract class OccurrenceStoreBase with Store {
  OccurrenceStoreBase(
    this.masterStore,
    this.appStore,
    this.loadOccurrences,
    this.createOccurrence,
    this.saveOccurrence,
    this.filterCurrentOccurrenceTypes,
  );

  final MasterStore masterStore;
  final AppStore appStore;
  final LoadOccurrencesUseCase loadOccurrences;
  final CreateOccurrenceUseCase createOccurrence;
  final SaveOccurrenceUseCase saveOccurrence;
  final FilterCurrentOccurrenceTypesUseCase filterCurrentOccurrenceTypes;

  @observable
  OccurrenceStatus status = OccurrenceStatus.loading;
  @observable
  List<OccurrenceEntity> occurrenceList = [];
  @observable
  List<OccurrenceTypeEntity> occurrenceTypes = [];
  @computed
  List<ScheduleEntity>? get scheduleList => masterStore.todayScheduleList;
  @computed
  Locale get userLanguage => appStore.language;

  @action
  void setStatus(OccurrenceStatus value) => status = value;
  @action
  void setOccurrenceList(List<OccurrenceEntity> value) =>
      occurrenceList = value;
  @action
  void setOccurrenceTypeList(List<OccurrenceTypeEntity> value) =>
      occurrenceTypes = value;

  @action
  Future onLoad() async {
    setStatus(OccurrenceStatus.loading);

    final response = await Future.wait([
      _loadOccurrences(),
    ]);
    if (response.any((element) => element == OccurrenceStatus.error)) {
      setStatus(OccurrenceStatus.error);
    }
    setStatus(OccurrenceStatus.success);
  }

  @action
  Future<void> loadOccurrenceTypes(ScheduleEntity schedule) async {
    setStatus(OccurrenceStatus.loading);
    final result = await filterCurrentOccurrenceTypes.call(
      occurrenceTypes: masterStore.occurrenceTypes,
      userProfile: appStore.profile,
      schedule: schedule,
    );
    final status = result.fold(
      (e) => OccurrenceStatus.error,
      (response) {
        setOccurrenceTypeList(response);
        return OccurrenceStatus.success;
      },
    );
    setStatus(status);
  }

  @action
  Future onSubmit({
    required String type,
    required String comments,
    required String lineId,
    required String rncNumber,
    required String scheduleNumber,
  }) async {
    setStatus(OccurrenceStatus.loading);

    final result = await _createOccurrence(
      OccurrenceEntity(
        comments: comments,
        lineId: int.tryParse(lineId),
        type: type,
        rncNumber: rncNumber,
        scheduleNumber: scheduleNumber,
        token: appStore.token,
        createdAt: DateTime.now().toString(),
      ),
    );
    await _loadOccurrences();
    setStatus(result);
    Modular.to.pop();
  }

  @action
  String getOccurrenceDescription(OccurrenceTypeEntity occurrenceType) {
    if (userLanguage.languageCode.toLowerCase() == 'en') {
      return occurrenceType.classificCodeUs;
    }
    if (userLanguage.languageCode.toLowerCase() == 'es') {
      return occurrenceType.classificCodeEs;
    }
    return occurrenceType.classificCodePt;
  }

  @action
  String getOccurrenceDescriptionById(String occurrenceTypeId) {
    final occurrenceType = masterStore.occurrenceTypes.firstWhereOrNull(
      (element) => element.classificId.toString() == occurrenceTypeId,
    );
    if (occurrenceType == null) {
      return '';
    }
    return getOccurrenceDescription(occurrenceType);
  }

  @action
  String? getLineDescription(ScheduleEntity schedule, int? lineId) {
    final line = schedule.lines.firstWhereOrNull(
      (element) => element.id == lineId,
    );
    if (line == null) {
      return null;
    }
    return '${line.orderNumber}/${line.lineNumber} ${line.itemDescription}';
  }

  Future<OccurrenceStatus> _createOccurrence(
    OccurrenceEntity occurrence,
  ) async {
    unawaited(createOccurrence.call(occurrence));
    final saveResult = await saveOccurrence.call(occurrence);

    return saveResult.fold(
      (l) => OccurrenceStatus.error,
      (r) => OccurrenceStatus.initial,
    );
  }

  Future<OccurrenceStatus> _loadOccurrences() async {
    final result = await loadOccurrences.call();
    return result.fold(
      (e) => OccurrenceStatus.error,
      (occurrences) {
        setOccurrenceList(occurrences);
        return OccurrenceStatus.success;
      },
    );
  }
}
