// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChecklistStore on ChecklistStoreBase, Store {
  Computed<bool>? _$isLoadingFlowStepsComputed;

  @override
  bool get isLoadingFlowSteps => (_$isLoadingFlowStepsComputed ??=
          Computed<bool>(() => super.isLoadingFlowSteps,
              name: 'ChecklistStoreBase.isLoadingFlowSteps'))
      .value;

  late final _$statusAtom =
      Atom(name: 'ChecklistStoreBase.status', context: context);

  @override
  ChecklistStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ChecklistStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$stepsAtom =
      Atom(name: 'ChecklistStoreBase.steps', context: context);

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

  late final _$executedStepsAtom =
      Atom(name: 'ChecklistStoreBase.executedSteps', context: context);

  @override
  List<ExecutedStepEntity> get executedSteps {
    _$executedStepsAtom.reportRead();
    return super.executedSteps;
  }

  @override
  set executedSteps(List<ExecutedStepEntity> value) {
    _$executedStepsAtom.reportWrite(value, super.executedSteps, () {
      super.executedSteps = value;
    });
  }

  late final _$scheduleAtom =
      Atom(name: 'ChecklistStoreBase.schedule', context: context);

  @override
  ScheduleEntity? get schedule {
    _$scheduleAtom.reportRead();
    return super.schedule;
  }

  @override
  set schedule(ScheduleEntity? value) {
    _$scheduleAtom.reportWrite(value, super.schedule, () {
      super.schedule = value;
    });
  }

  late final _$disposeAtom =
      Atom(name: 'ChecklistStoreBase.dispose', context: context);

  @override
  ReactionDisposer? get dispose {
    _$disposeAtom.reportRead();
    return super.dispose;
  }

  @override
  set dispose(ReactionDisposer? value) {
    _$disposeAtom.reportWrite(value, super.dispose, () {
      super.dispose = value;
    });
  }

  late final _$onLoadAsyncAction =
      AsyncAction('ChecklistStoreBase.onLoad', context: context);

  @override
  Future<dynamic> onLoad(ScheduleEntity? currentSchedule) {
    return _$onLoadAsyncAction.run(() => super.onLoad(currentSchedule));
  }

  late final _$ChecklistStoreBaseActionController =
      ActionController(name: 'ChecklistStoreBase', context: context);

  @override
  void setupReactions() {
    final _$actionInfo = _$ChecklistStoreBaseActionController.startAction(
        name: 'ChecklistStoreBase.setupReactions');
    try {
      return super.setupReactions();
    } finally {
      _$ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(ChecklistStatus value) {
    final _$actionInfo = _$ChecklistStoreBaseActionController.startAction(
        name: 'ChecklistStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocalSchedule(ScheduleEntity value) {
    final _$actionInfo = _$ChecklistStoreBaseActionController.startAction(
        name: 'ChecklistStoreBase.setLocalSchedule');
    try {
      return super.setLocalSchedule(value);
    } finally {
      _$ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSteps(List<FlowStepEntity> value) {
    final _$actionInfo = _$ChecklistStoreBaseActionController.startAction(
        name: 'ChecklistStoreBase.setSteps');
    try {
      return super.setSteps(value);
    } finally {
      _$ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExecutedSteps(List<ExecutedStepEntity> value) {
    final _$actionInfo = _$ChecklistStoreBaseActionController.startAction(
        name: 'ChecklistStoreBase.setExecutedSteps');
    try {
      return super.setExecutedSteps(value);
    } finally {
      _$ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, String> getFieldsMap(BuildContext context,
      ScheduleEntity schedule, String flowCode, bool balanceTag) {
    final _$actionInfo = _$ChecklistStoreBaseActionController.startAction(
        name: 'ChecklistStoreBase.getFieldsMap');
    try {
      return super.getFieldsMap(context, schedule, flowCode, balanceTag);
    } finally {
      _$ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<QuestionEntity> getQuestions(
      FlowStepEntity flowStep, ScheduleEntity schedule) {
    final _$actionInfo = _$ChecklistStoreBaseActionController.startAction(
        name: 'ChecklistStoreBase.getQuestions');
    try {
      return super.getQuestions(flowStep, schedule);
    } finally {
      _$ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<SignatureEntity> getSignatures(
      FlowStepEntity flowStep, ScheduleEntity schedule) {
    final _$actionInfo = _$ChecklistStoreBaseActionController.startAction(
        name: 'ChecklistStoreBase.getSignatures');
    try {
      return super.getSignatures(flowStep, schedule);
    } finally {
      _$ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<AnswerEntity> getAnswers(
      List<QuestionEntity> questions, ScheduleEntity schedule) {
    final _$actionInfo = _$ChecklistStoreBaseActionController.startAction(
        name: 'ChecklistStoreBase.getAnswers');
    try {
      return super.getAnswers(questions, schedule);
    } finally {
      _$ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
steps: ${steps},
executedSteps: ${executedSteps},
schedule: ${schedule},
dispose: ${dispose},
isLoadingFlowSteps: ${isLoadingFlowSteps}
    ''';
  }
}
