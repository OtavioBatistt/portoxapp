// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occurrence_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OccurrenceStore on OccurrenceStoreBase, Store {
  Computed<List<ScheduleEntity>?>? _$scheduleListComputed;

  @override
  List<ScheduleEntity>? get scheduleList => (_$scheduleListComputed ??=
          Computed<List<ScheduleEntity>?>(() => super.scheduleList,
              name: 'OccurrenceStoreBase.scheduleList'))
      .value;
  Computed<Locale>? _$userLanguageComputed;

  @override
  Locale get userLanguage =>
      (_$userLanguageComputed ??= Computed<Locale>(() => super.userLanguage,
              name: 'OccurrenceStoreBase.userLanguage'))
          .value;

  late final _$statusAtom =
      Atom(name: 'OccurrenceStoreBase.status', context: context);

  @override
  OccurrenceStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(OccurrenceStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$occurrenceListAtom =
      Atom(name: 'OccurrenceStoreBase.occurrenceList', context: context);

  @override
  List<OccurrenceEntity> get occurrenceList {
    _$occurrenceListAtom.reportRead();
    return super.occurrenceList;
  }

  @override
  set occurrenceList(List<OccurrenceEntity> value) {
    _$occurrenceListAtom.reportWrite(value, super.occurrenceList, () {
      super.occurrenceList = value;
    });
  }

  late final _$occurrenceTypesAtom =
      Atom(name: 'OccurrenceStoreBase.occurrenceTypes', context: context);

  @override
  List<OccurrenceTypeEntity> get occurrenceTypes {
    _$occurrenceTypesAtom.reportRead();
    return super.occurrenceTypes;
  }

  @override
  set occurrenceTypes(List<OccurrenceTypeEntity> value) {
    _$occurrenceTypesAtom.reportWrite(value, super.occurrenceTypes, () {
      super.occurrenceTypes = value;
    });
  }

  late final _$onLoadAsyncAction =
      AsyncAction('OccurrenceStoreBase.onLoad', context: context);

  @override
  Future<dynamic> onLoad() {
    return _$onLoadAsyncAction.run(() => super.onLoad());
  }

  late final _$loadOccurrenceTypesAsyncAction =
      AsyncAction('OccurrenceStoreBase.loadOccurrenceTypes', context: context);

  @override
  Future<void> loadOccurrenceTypes(ScheduleEntity schedule) {
    return _$loadOccurrenceTypesAsyncAction
        .run(() => super.loadOccurrenceTypes(schedule));
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('OccurrenceStoreBase.onSubmit', context: context);

  @override
  Future<dynamic> onSubmit(
      {required String type,
      required String comments,
      required String lineId,
      required String rncNumber,
      required String scheduleNumber}) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(
        type: type,
        comments: comments,
        lineId: lineId,
        rncNumber: rncNumber,
        scheduleNumber: scheduleNumber));
  }

  late final _$OccurrenceStoreBaseActionController =
      ActionController(name: 'OccurrenceStoreBase', context: context);

  @override
  void setStatus(OccurrenceStatus value) {
    final _$actionInfo = _$OccurrenceStoreBaseActionController.startAction(
        name: 'OccurrenceStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOccurrenceList(List<OccurrenceEntity> value) {
    final _$actionInfo = _$OccurrenceStoreBaseActionController.startAction(
        name: 'OccurrenceStoreBase.setOccurrenceList');
    try {
      return super.setOccurrenceList(value);
    } finally {
      _$OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOccurrenceTypeList(List<OccurrenceTypeEntity> value) {
    final _$actionInfo = _$OccurrenceStoreBaseActionController.startAction(
        name: 'OccurrenceStoreBase.setOccurrenceTypeList');
    try {
      return super.setOccurrenceTypeList(value);
    } finally {
      _$OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getOccurrenceDescription(OccurrenceTypeEntity occurrenceType) {
    final _$actionInfo = _$OccurrenceStoreBaseActionController.startAction(
        name: 'OccurrenceStoreBase.getOccurrenceDescription');
    try {
      return super.getOccurrenceDescription(occurrenceType);
    } finally {
      _$OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getOccurrenceDescriptionById(String occurrenceTypeId) {
    final _$actionInfo = _$OccurrenceStoreBaseActionController.startAction(
        name: 'OccurrenceStoreBase.getOccurrenceDescriptionById');
    try {
      return super.getOccurrenceDescriptionById(occurrenceTypeId);
    } finally {
      _$OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? getLineDescription(ScheduleEntity schedule, int? lineId) {
    final _$actionInfo = _$OccurrenceStoreBaseActionController.startAction(
        name: 'OccurrenceStoreBase.getLineDescription');
    try {
      return super.getLineDescription(schedule, lineId);
    } finally {
      _$OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
occurrenceList: ${occurrenceList},
occurrenceTypes: ${occurrenceTypes},
scheduleList: ${scheduleList},
userLanguage: ${userLanguage}
    ''';
  }
}
