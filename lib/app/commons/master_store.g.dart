// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MasterStore on MasterStoreBase, Store {
  late final _$isLoadingQuestionsAtom =
      Atom(name: 'MasterStoreBase.isLoadingQuestions', context: context);

  @override
  bool get isLoadingQuestions {
    _$isLoadingQuestionsAtom.reportRead();
    return super.isLoadingQuestions;
  }

  @override
  set isLoadingQuestions(bool value) {
    _$isLoadingQuestionsAtom.reportWrite(value, super.isLoadingQuestions, () {
      super.isLoadingQuestions = value;
    });
  }

  late final _$isLoadingFlowStepsAtom =
      Atom(name: 'MasterStoreBase.isLoadingFlowSteps', context: context);

  @override
  bool get isLoadingFlowSteps {
    _$isLoadingFlowStepsAtom.reportRead();
    return super.isLoadingFlowSteps;
  }

  @override
  set isLoadingFlowSteps(bool value) {
    _$isLoadingFlowStepsAtom.reportWrite(value, super.isLoadingFlowSteps, () {
      super.isLoadingFlowSteps = value;
    });
  }

  late final _$isLoadingAnswersAtom =
      Atom(name: 'MasterStoreBase.isLoadingAnswers', context: context);

  @override
  bool get isLoadingAnswers {
    _$isLoadingAnswersAtom.reportRead();
    return super.isLoadingAnswers;
  }

  @override
  set isLoadingAnswers(bool value) {
    _$isLoadingAnswersAtom.reportWrite(value, super.isLoadingAnswers, () {
      super.isLoadingAnswers = value;
    });
  }

  late final _$isLoadingSignaturesAtom =
      Atom(name: 'MasterStoreBase.isLoadingSignatures', context: context);

  @override
  bool get isLoadingSignatures {
    _$isLoadingSignaturesAtom.reportRead();
    return super.isLoadingSignatures;
  }

  @override
  set isLoadingSignatures(bool value) {
    _$isLoadingSignaturesAtom.reportWrite(value, super.isLoadingSignatures, () {
      super.isLoadingSignatures = value;
    });
  }

  late final _$isLoadingOccurrenceTypesAtom =
      Atom(name: 'MasterStoreBase.isLoadingOccurrenceTypes', context: context);

  @override
  bool get isLoadingOccurrenceTypes {
    _$isLoadingOccurrenceTypesAtom.reportRead();
    return super.isLoadingOccurrenceTypes;
  }

  @override
  set isLoadingOccurrenceTypes(bool value) {
    _$isLoadingOccurrenceTypesAtom
        .reportWrite(value, super.isLoadingOccurrenceTypes, () {
      super.isLoadingOccurrenceTypes = value;
    });
  }

  late final _$questionsAtom =
      Atom(name: 'MasterStoreBase.questions', context: context);

  @override
  List<QuestionEntity> get questions {
    _$questionsAtom.reportRead();
    return super.questions;
  }

  @override
  set questions(List<QuestionEntity> value) {
    _$questionsAtom.reportWrite(value, super.questions, () {
      super.questions = value;
    });
  }

  late final _$flowStepsAtom =
      Atom(name: 'MasterStoreBase.flowSteps', context: context);

  @override
  List<FlowStepEntity> get flowSteps {
    _$flowStepsAtom.reportRead();
    return super.flowSteps;
  }

  @override
  set flowSteps(List<FlowStepEntity> value) {
    _$flowStepsAtom.reportWrite(value, super.flowSteps, () {
      super.flowSteps = value;
    });
  }

  late final _$answersAtom =
      Atom(name: 'MasterStoreBase.answers', context: context);

  @override
  List<AnswerEntity> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(List<AnswerEntity> value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
    });
  }

  late final _$signaturesAtom =
      Atom(name: 'MasterStoreBase.signatures', context: context);

  @override
  List<SignatureEntity> get signatures {
    _$signaturesAtom.reportRead();
    return super.signatures;
  }

  @override
  set signatures(List<SignatureEntity> value) {
    _$signaturesAtom.reportWrite(value, super.signatures, () {
      super.signatures = value;
    });
  }

  late final _$occurrenceTypesAtom =
      Atom(name: 'MasterStoreBase.occurrenceTypes', context: context);

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

  late final _$scheduleListAtom =
      Atom(name: 'MasterStoreBase.scheduleList', context: context);

  @override
  List<ScheduleEntity>? get scheduleList {
    _$scheduleListAtom.reportRead();
    return super.scheduleList;
  }

  @override
  set scheduleList(List<ScheduleEntity>? value) {
    _$scheduleListAtom.reportWrite(value, super.scheduleList, () {
      super.scheduleList = value;
    });
  }

  late final _$todayScheduleListAtom =
      Atom(name: 'MasterStoreBase.todayScheduleList', context: context);

  @override
  List<ScheduleEntity>? get todayScheduleList {
    _$todayScheduleListAtom.reportRead();
    return super.todayScheduleList;
  }

  @override
  set todayScheduleList(List<ScheduleEntity>? value) {
    _$todayScheduleListAtom.reportWrite(value, super.todayScheduleList, () {
      super.todayScheduleList = value;
    });
  }

  late final _$scheduleStreamAtom =
      Atom(name: 'MasterStoreBase.scheduleStream', context: context);

  @override
  StreamSubscription<dynamic>? get scheduleStream {
    _$scheduleStreamAtom.reportRead();
    return super.scheduleStream;
  }

  @override
  set scheduleStream(StreamSubscription<dynamic>? value) {
    _$scheduleStreamAtom.reportWrite(value, super.scheduleStream, () {
      super.scheduleStream = value;
    });
  }

  late final _$progressAtom =
      Atom(name: 'MasterStoreBase.progress', context: context);

  @override
  int get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(int value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  late final _$loadMasterDataAsyncAction =
      AsyncAction('MasterStoreBase.loadMasterData', context: context);

  @override
  Future<void> loadMasterData() {
    return _$loadMasterDataAsyncAction.run(() => super.loadMasterData());
  }

  late final _$loadSchedulesAsyncAction =
      AsyncAction('MasterStoreBase.loadSchedules', context: context);

  @override
  Future<void> loadSchedules(List<String>? plantCodes) {
    return _$loadSchedulesAsyncAction
        .run(() => super.loadSchedules(plantCodes));
  }

  late final _$MasterStoreBaseActionController =
      ActionController(name: 'MasterStoreBase', context: context);

  @override
  void setLoadingQuestions({required bool value}) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setLoadingQuestions');
    try {
      return super.setLoadingQuestions(value: value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingAnswers({required bool value}) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setLoadingAnswers');
    try {
      return super.setLoadingAnswers(value: value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingFlowSteps({required bool value}) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setLoadingFlowSteps');
    try {
      return super.setLoadingFlowSteps(value: value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingSignatures({required bool value}) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setLoadingSignatures');
    try {
      return super.setLoadingSignatures(value: value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingOccurrenceTypes({required bool value}) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setLoadingOccurrenceTypes');
    try {
      return super.setLoadingOccurrenceTypes(value: value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuestions(List<QuestionEntity> value) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setQuestions');
    try {
      return super.setQuestions(value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnswers(List<AnswerEntity> value) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setAnswers');
    try {
      return super.setAnswers(value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFlowSteps(List<FlowStepEntity> value) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setFlowSteps');
    try {
      return super.setFlowSteps(value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignatures(List<SignatureEntity> value) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setSignatures');
    try {
      return super.setSignatures(value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOccurrenceTypes(List<OccurrenceTypeEntity> value) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setOccurrenceTypes');
    try {
      return super.setOccurrenceTypes(value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScheduleList(List<ScheduleEntity> value) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setScheduleList');
    try {
      return super.setScheduleList(value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTodayScheduleList(List<ScheduleEntity> value) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setTodayScheduleList');
    try {
      return super.setTodayScheduleList(value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScheduleStream(StreamSubscription<dynamic> value) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setScheduleStream');
    try {
      return super.setScheduleStream(value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProgress(int value) {
    final _$actionInfo = _$MasterStoreBaseActionController.startAction(
        name: 'MasterStoreBase.setProgress');
    try {
      return super.setProgress(value);
    } finally {
      _$MasterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingQuestions: ${isLoadingQuestions},
isLoadingFlowSteps: ${isLoadingFlowSteps},
isLoadingAnswers: ${isLoadingAnswers},
isLoadingSignatures: ${isLoadingSignatures},
isLoadingOccurrenceTypes: ${isLoadingOccurrenceTypes},
questions: ${questions},
flowSteps: ${flowSteps},
answers: ${answers},
signatures: ${signatures},
occurrenceTypes: ${occurrenceTypes},
scheduleList: ${scheduleList},
todayScheduleList: ${todayScheduleList},
scheduleStream: ${scheduleStream},
progress: ${progress}
    ''';
  }
}
