import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:portox_app/app/commons/adapters/device/device_adapter.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/occurrence_type_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_answers.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_flow_steps.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_occurrence_types.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_questions.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_schedules.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_signatures.dart';

part 'master_store.g.dart';

class MasterStore = MasterStoreBase with _$MasterStore;

abstract class MasterStoreBase with Store {
  MasterStoreBase(
    this.loadSchedulesUseCase,
    this.loadFlowStepsUseCase,
    this.loadQuestionsUseCase,
    this.loadAnswersUseCase,
    this.loadOccurrenceTypesUseCase,
    this.loadSignaturesUseCase,
    this.deviceAdapter,
  );

  final LoadSchedulesUseCase loadSchedulesUseCase;
  final LoadAndSaveFlowStepsUseCase loadFlowStepsUseCase;
  final LoadAndSaveQuestionsUseCase loadQuestionsUseCase;
  final LoadAndSaveAnswersUseCase loadAnswersUseCase;
  final LoadAndSaveOccurrenceTypesUseCase loadOccurrenceTypesUseCase;
  final LoadAndSaveSignaturesUseCase loadSignaturesUseCase;
  final IDeviceAdapter deviceAdapter;

  @observable
  bool isLoadingQuestions = false;
  @observable
  bool isLoadingFlowSteps = false;
  @observable
  bool isLoadingAnswers = false;
  @observable
  bool isLoadingSignatures = false;
  @observable
  bool isLoadingOccurrenceTypes = false;
  @observable
  List<QuestionEntity> questions = [];
  @observable
  List<FlowStepEntity> flowSteps = [];
  @observable
  List<AnswerEntity> answers = [];
  @observable
  List<SignatureEntity> signatures = [];
  @observable
  List<OccurrenceTypeEntity> occurrenceTypes = [];
  @observable
  List<ScheduleEntity>? scheduleList;
  @observable
  List<ScheduleEntity>? todayScheduleList;
  @observable
  StreamSubscription? scheduleStream;
  @observable
  int progress = 0;

  @action
  void setLoadingQuestions({required bool value}) => isLoadingQuestions = value;
  @action
  void setLoadingAnswers({required bool value}) => isLoadingAnswers = value;
  @action
  void setLoadingFlowSteps({required bool value}) => isLoadingFlowSteps = value;
  @action
  void setLoadingSignatures({required bool value}) =>
      isLoadingSignatures = value;
  @action
  void setLoadingOccurrenceTypes({required bool value}) =>
      isLoadingOccurrenceTypes = value;
  @action
  void setQuestions(List<QuestionEntity> value) => questions = value;
  @action
  void setAnswers(List<AnswerEntity> value) => answers = value;
  @action
  void setFlowSteps(List<FlowStepEntity> value) => flowSteps = value;
  @action
  void setSignatures(List<SignatureEntity> value) => signatures = value;
  @action
  void setOccurrenceTypes(List<OccurrenceTypeEntity> value) =>
      occurrenceTypes = value;
  @action
  void setScheduleList(List<ScheduleEntity> value) => scheduleList = value;
  @action
  void setTodayScheduleList(List<ScheduleEntity> value) =>
      todayScheduleList = value;
  @action
  void setScheduleStream(StreamSubscription value) => scheduleStream = value;
  @action
  void setProgress(int value) => progress = value;

  @action
  Future<void> loadMasterData() async {
    final deviceSerial = await deviceAdapter.getSerial();

    await Future.wait([
      loadFlowSteps(deviceSerial),
      loadAnswers(deviceSerial),
      loadOccurrenceTypes(deviceSerial),
      loadQuestions(deviceSerial),
      loadSignatures(deviceSerial),
    ]);
  }

  @action
  Future<void> loadSchedules(List<String>? plantCodes) async {
    await scheduleStream?.cancel();
    debugPrint('open - onListenChange: ${DateTime.now()}');
    final result = await loadSchedulesUseCase.call(
      (list) {
        final today = DateTime.now();
        final todaySchedules = list
            .where((element) => element.window.day == today.day)
            .toList()
          ..sort((a, b) => a.scheduleNumber.compareTo(b.scheduleNumber));
        setTodayScheduleList(todaySchedules);
        setScheduleList(list);
      },
      plantCodes: plantCodes,
    );
    result.fold(
      (e) {},
      setScheduleStream,
    );
  }

  Future<void> loadAnswers(String deviceSerial) async {
    if (isLoadingAnswers) {
      return;
    }
    setLoadingAnswers(value: true);
    final result = await loadAnswersUseCase.call(deviceSerial);
    setProgress(progress + 20);
    return result.fold(
      (e) => setLoadingAnswers(value: false),
      (answers) {
        setAnswers(answers);
        setLoadingAnswers(value: false);
      },
    );
  }

  Future<void> loadFlowSteps(String deviceSerial) async {
    if (isLoadingFlowSteps) {
      return;
    }
    setLoadingFlowSteps(value: true);
    final result = await loadFlowStepsUseCase.call(deviceSerial);
    setProgress(progress + 20);
    return result.fold(
      (e) => setLoadingFlowSteps(value: false),
      (flowSteps) {
        setFlowSteps(flowSteps);
        setLoadingFlowSteps(value: false);
      },
    );
  }

  Future<void> loadOccurrenceTypes(String deviceSerial) async {
    if (isLoadingOccurrenceTypes) {
      return;
    }
    setLoadingOccurrenceTypes(value: true);
    final result = await loadOccurrenceTypesUseCase.call(deviceSerial);
    setProgress(progress + 20);
    return result.fold(
      (e) => setLoadingOccurrenceTypes(value: false),
      (occurrenceTypes) {
        setOccurrenceTypes(occurrenceTypes);
        setLoadingOccurrenceTypes(value: false);
      },
    );
  }

  Future<void> loadQuestions(String deviceSerial) async {
    if (isLoadingQuestions) {
      return;
    }
    setLoadingQuestions(value: true);
    final result = await loadQuestionsUseCase.call(deviceSerial);
    setProgress(progress + 20);
    return result.fold(
      (e) => setLoadingQuestions(value: false),
      (questions) {
        setQuestions(questions);
        setLoadingQuestions(value: false);
      },
    );
  }

  Future<void> loadSignatures(String deviceSerial) async {
    if (isLoadingSignatures) {
      return;
    }
    setLoadingSignatures(value: true);
    final result = await loadSignaturesUseCase.call(deviceSerial);
    setProgress(progress + 20);
    return result.fold(
      (e) => setLoadingSignatures(value: false),
      (signatures) {
        setSignatures(signatures);
        setLoadingSignatures(value: false);
      },
    );
  }
}
