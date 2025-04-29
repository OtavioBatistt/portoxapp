// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepStore on StepStoreBase, Store {
  late final _$statusAtom =
      Atom(name: 'StepStoreBase.status', context: context);

  @override
  StepStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(StepStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$fieldsAtom =
      Atom(name: 'StepStoreBase.fields', context: context);

  @override
  Map<String, String> get fields {
    _$fieldsAtom.reportRead();
    return super.fields;
  }

  @override
  set fields(Map<String, String> value) {
    _$fieldsAtom.reportWrite(value, super.fields, () {
      super.fields = value;
    });
  }

  late final _$tagAtom = Atom(name: 'StepStoreBase.tag', context: context);

  @override
  String get tag {
    _$tagAtom.reportRead();
    return super.tag;
  }

  @override
  set tag(String value) {
    _$tagAtom.reportWrite(value, super.tag, () {
      super.tag = value;
    });
  }

  late final _$sealsAtom = Atom(name: 'StepStoreBase.seals', context: context);

  @override
  List<ChecklistSealEntity> get seals {
    _$sealsAtom.reportRead();
    return super.seals;
  }

  @override
  set seals(List<ChecklistSealEntity> value) {
    _$sealsAtom.reportWrite(value, super.seals, () {
      super.seals = value;
    });
  }

  late final _$supervisorsAtom =
      Atom(name: 'StepStoreBase.supervisors', context: context);

  @override
  List<SupervisorEntity> get supervisors {
    _$supervisorsAtom.reportRead();
    return super.supervisors;
  }

  @override
  set supervisors(List<SupervisorEntity> value) {
    _$supervisorsAtom.reportWrite(value, super.supervisors, () {
      super.supervisors = value;
    });
  }

  late final _$weightAtom =
      Atom(name: 'StepStoreBase.weight', context: context);

  @override
  double? get weight {
    _$weightAtom.reportRead();
    return super.weight;
  }

  @override
  set weight(double? value) {
    _$weightAtom.reportWrite(value, super.weight, () {
      super.weight = value;
    });
  }

  late final _$enableWeightFieldAtom =
      Atom(name: 'StepStoreBase.enableWeightField', context: context);

  @override
  bool get enableWeightField {
    _$enableWeightFieldAtom.reportRead();
    return super.enableWeightField;
  }

  @override
  set enableWeightField(bool value) {
    _$enableWeightFieldAtom.reportWrite(value, super.enableWeightField, () {
      super.enableWeightField = value;
    });
  }

  late final _$stepsAtom = Atom(name: 'StepStoreBase.steps', context: context);

  @override
  List<FlowStepEntity> get steps {
    _$stepsAtom.reportRead();
    return super.steps;
  }

  @override
  set steps(List<FlowStepEntity> value) {
    _$stepsAtom.reportWrite(value, super.steps, () {
      super.steps = value;
    });
  }

  late final _$onSubmitConfirmationAsyncAction =
      AsyncAction('StepStoreBase.onSubmitConfirmation', context: context);

  @override
  Future<dynamic> onSubmitConfirmation(
      {required bool accepted,
      required String flowCode,
      required ScheduleEntity schedule,
      required bool hasTag,
      int? compartment}) {
    return _$onSubmitConfirmationAsyncAction.run(() => super
        .onSubmitConfirmation(
            accepted: accepted,
            flowCode: flowCode,
            schedule: schedule,
            hasTag: hasTag,
            compartment: compartment));
  }

  late final _$onSubmitWithQuestionsAsyncAction =
      AsyncAction('StepStoreBase.onSubmitWithQuestions', context: context);

  @override
  Future<dynamic> onSubmitWithQuestions(
      {required bool accepted,
      required String flowCode,
      required ScheduleEntity schedule,
      required List<ChecklistAnswerEntity> answers,
      required List<ChecklistSignatureEntity> signatures,
      int? compartment}) {
    return _$onSubmitWithQuestionsAsyncAction.run(() => super
        .onSubmitWithQuestions(
            accepted: accepted,
            flowCode: flowCode,
            schedule: schedule,
            answers: answers,
            signatures: signatures,
            compartment: compartment));
  }

  late final _$onSubmitWithWeightAsyncAction =
      AsyncAction('StepStoreBase.onSubmitWithWeight', context: context);

  @override
  Future<dynamic> onSubmitWithWeight(
      {required bool accepted,
      required String flowCode,
      required ScheduleEntity schedule,
      required int compartment,
      double? weight,
      int? supervisor}) {
    return _$onSubmitWithWeightAsyncAction.run(() => super.onSubmitWithWeight(
        accepted: accepted,
        flowCode: flowCode,
        schedule: schedule,
        compartment: compartment,
        weight: weight,
        supervisor: supervisor));
  }

  late final _$onSubmitWithSealsAsyncAction =
      AsyncAction('StepStoreBase.onSubmitWithSeals', context: context);

  @override
  Future<dynamic> onSubmitWithSeals(
      {required bool accepted,
      required String flowCode,
      required ScheduleEntity schedule,
      List<ChecklistSealEntity>? seals,
      int? compartment}) {
    return _$onSubmitWithSealsAsyncAction.run(() => super.onSubmitWithSeals(
        accepted: accepted,
        flowCode: flowCode,
        schedule: schedule,
        seals: seals,
        compartment: compartment));
  }

  late final _$checkTagAsyncAction =
      AsyncAction('StepStoreBase.checkTag', context: context);

  @override
  Future<String> checkTag(String scheduleNumber, List<String> codes) {
    return _$checkTagAsyncAction
        .run(() => super.checkTag(scheduleNumber, codes));
  }

  late final _$checkSealAsyncAction =
      AsyncAction('StepStoreBase.checkSeal', context: context);

  @override
  Future<String> checkSeal(
      String scheduleNumber, ChecklistSealEntity seal, bool hasConnection) {
    return _$checkSealAsyncAction
        .run(() => super.checkSeal(scheduleNumber, seal, hasConnection));
  }

  late final _$confirmSupervisorPasswordAsyncAction =
      AsyncAction('StepStoreBase.confirmSupervisorPassword', context: context);

  @override
  Future<bool> confirmSupervisorPassword(
      SupervisorEntity supervisor, String password) {
    return _$confirmSupervisorPasswordAsyncAction
        .run(() => super.confirmSupervisorPassword(supervisor, password));
  }

  late final _$loadWeightAsyncAction =
      AsyncAction('StepStoreBase.loadWeight', context: context);

  @override
  Future<void> loadWeight(
      {required String scheduleNumber,
      required String compartment,
      required String flowCode}) {
    return _$loadWeightAsyncAction.run(() => super.loadWeight(
        scheduleNumber: scheduleNumber,
        compartment: compartment,
        flowCode: flowCode));
  }

  late final _$StepStoreBaseActionController =
      ActionController(name: 'StepStoreBase', context: context);

  @override
  void setStatus(StepStatus value) {
    final _$actionInfo = _$StepStoreBaseActionController.startAction(
        name: 'StepStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$StepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFields(Map<String, String> value) {
    final _$actionInfo = _$StepStoreBaseActionController.startAction(
        name: 'StepStoreBase.setFields');
    try {
      return super.setFields(value);
    } finally {
      _$StepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWeight(double? value) {
    final _$actionInfo = _$StepStoreBaseActionController.startAction(
        name: 'StepStoreBase.setWeight');
    try {
      return super.setWeight(value);
    } finally {
      _$StepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTag(String value) {
    final _$actionInfo = _$StepStoreBaseActionController.startAction(
        name: 'StepStoreBase.setTag');
    try {
      return super.setTag(value);
    } finally {
      _$StepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnableWeightField({required bool value}) {
    final _$actionInfo = _$StepStoreBaseActionController.startAction(
        name: 'StepStoreBase.setEnableWeightField');
    try {
      return super.setEnableWeightField(value: value);
    } finally {
      _$StepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSeal(ChecklistSealEntity value) {
    final _$actionInfo = _$StepStoreBaseActionController.startAction(
        name: 'StepStoreBase.addSeal');
    try {
      return super.addSeal(value);
    } finally {
      _$StepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSeal(int value) {
    final _$actionInfo = _$StepStoreBaseActionController.startAction(
        name: 'StepStoreBase.removeSeal');
    try {
      return super.removeSeal(value);
    } finally {
      _$StepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSupervisors(List<SupervisorEntity> value) {
    final _$actionInfo = _$StepStoreBaseActionController.startAction(
        name: 'StepStoreBase.setSupervisors');
    try {
      return super.setSupervisors(value);
    } finally {
      _$StepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadSupervisors() {
    final _$actionInfo = _$StepStoreBaseActionController.startAction(
        name: 'StepStoreBase.loadSupervisors');
    try {
      return super.loadSupervisors();
    } finally {
      _$StepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
fields: ${fields},
tag: ${tag},
seals: ${seals},
supervisors: ${supervisors},
weight: ${weight},
enableWeightField: ${enableWeightField},
steps: ${steps}
    ''';
  }
}
