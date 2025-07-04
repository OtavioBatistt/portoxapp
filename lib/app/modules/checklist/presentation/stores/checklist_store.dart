import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';
import 'package:portox_app/app/commons/master_store.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/executed_step.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/filter_current_answers.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/filter_current_questions.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/filter_current_signatures.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/filter_current_steps.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/load_checklist_by_schedule_number.dart';

part 'checklist_store.g.dart';

class ChecklistStore = ChecklistStoreBase with _$ChecklistStore;

enum ChecklistStatus { initial, loading, success, error }

abstract class ChecklistStoreBase with Store {
  ChecklistStoreBase(
    this.appStore,
    this.masterStore,
    this.loadChecklists,
    this.filterCurrentSteps,
    this.filterCurrentSignatures,
    this.filterCurrentQuestions,
    this.filterCurrentAnswers,
  );
  final AppStore appStore;
  final MasterStore masterStore;
  final FilterCurrentStepsUseCase filterCurrentSteps;
  final FilterCurrentSignaturesUseCase filterCurrentSignatures;
  final FilterCurrentQuestionsUseCase filterCurrentQuestions;
  final FilterCurrentAnswersUseCase filterCurrentAnswers;
  final LoadChecklistByScheduleNumberUseCase loadChecklists;

  @observable
  ChecklistStatus status = ChecklistStatus.initial;
  @observable
  List<FlowStepEntity> steps = [];
  @observable
  List<ExecutedStepEntity> executedSteps = [];
  @observable
  ScheduleEntity? schedule;
  @computed
  bool get isLoadingFlowSteps => masterStore.isLoadingFlowSteps;
  @observable
  ReactionDisposer? dispose;

  @action
  void setupReactions() {
    dispose = autorun((_) {
      if (!isLoadingFlowSteps) {
        onLoad(schedule);
      }
    });
  }

  @action
  void setStatus(ChecklistStatus value) => status = value;
  @action
  void setLocalSchedule(ScheduleEntity value) => schedule = value;
  @action
  void setSteps(List<FlowStepEntity> value) => steps = value;
  @action
  void setExecutedSteps(List<ExecutedStepEntity> value) =>
      executedSteps = value;

  @action
  Future onLoad(ScheduleEntity? currentSchedule) async {
    setStatus(ChecklistStatus.loading);
    if (currentSchedule != null) {
      setLocalSchedule(currentSchedule);
    }
    if (schedule == null) {
      return;
    }

    final response = await _filterCurrentSteps(schedule!);
    await _loadChecklists(schedule!.scheduleNumber);
    setStatus(response);
  }

  @action
  Map<String, String> getFieldsMap(
    BuildContext context,
    ScheduleEntity schedule,
    String flowCode,
    bool balanceTag,
  ) {
    final fields = _getFieldsByFlowCode(flowCode, balanceTag);

    final isValidDocument = schedule.carrierDocValid == null
        ? ''
        : schedule.carrierDocValid!
            ? intl(context, 'schedule.doc-valid')
            : intl(context, 'schedule.doc-invalid');

    final completeMap = {
      'window': schedule.formatWindowAndLocation(context),
      'truck-plate': schedule.truckPlate,
      'trailer-plate': schedule.trailerPlate,
      'driver': schedule.driverName,
      'driver-document': isValidDocument,
      'carrier': schedule.carrierName,
      'tag': '',
      'weight': '',
    };

    final result = <String, String>{};
    for (final field in fields) {
      final value = completeMap[field];
      result.addAll({
        intl(context, 'schedule.$field-field'):
            (value?.isNotEmpty ?? false) ? value! : '-'
      });
    }
    return result;
  }

  List<String> _getFieldsByFlowCode(String flowCode, bool balanceTag) {
    if (flowCode.contains('WEIGHTING')) {
      return ['window', 'truck-plate', 'trailer-plate', 'carrier', 'weight'];
    }
    if (flowCode.contains('AWAITTING_SHOW')) {
      final awaitingShowList = [
        'window',
        'truck-plate',
        'trailer-plate',
        'driver',
        'driver-document'
      ];
      if (balanceTag) {
        awaitingShowList.add('tag');
      }
      return awaitingShowList;
    }

    return [
      'window',
      'truck-plate',
      'trailer-plate',
      'carrier',
    ];
  }

  Future<ChecklistStatus> _filterCurrentSteps(ScheduleEntity schedule) async {
    final result = await filterCurrentSteps.call(
      userProfile: appStore.profile,
      flowSteps: masterStore.flowSteps,
      schedule: schedule,
    );
    return result.fold(
      (e) => ChecklistStatus.error,
      (response) {
        if (!schedule.sealLetter) {
          response.removeWhere(
              (step) => step.flowCode == 'AWAITTING_SCAN_SEAL_LETTER');
        }
        setSteps(response);
        return ChecklistStatus.success;
      },
    );
  }

  Future<ChecklistStatus> _loadChecklists(String scheduleNumber) async {
    final result = await loadChecklists.call(scheduleNumber);
    return result.fold(
      (e) => ChecklistStatus.error,
      (response) {
        setExecutedSteps(response);
        return ChecklistStatus.success;
      },
    );
  }

  @action
  List<QuestionEntity> getQuestions(
    FlowStepEntity flowStep,
    ScheduleEntity schedule,
  ) {
    final result = filterCurrentQuestions.call(
      questions: masterStore.questions,
      flowStep: flowStep,
      schedule: schedule,
    );
    return result.fold(
      (e) => [],
      (response) => response,
    );
  }

  @action
  List<SignatureEntity> getSignatures(
    FlowStepEntity flowStep,
    ScheduleEntity schedule,
  ) {
    final result = filterCurrentSignatures.call(
      signatures: masterStore.signatures,
      flowStep: flowStep,
      schedule: schedule,
    );
    return result.fold(
      (e) => [],
      (response) => response,
    );
  }

  @action
  List<AnswerEntity> getAnswers(
    List<QuestionEntity> questions,
    ScheduleEntity schedule,
  ) {
    final result = filterCurrentAnswers.call(
      answers: masterStore.answers,
      schedule: schedule,
      questions: questions,
    );
    return result.fold(
      (e) => [],
      (response) => response,
    );
  }
}
