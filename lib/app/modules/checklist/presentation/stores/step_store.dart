import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:portox_app/app/commons/adapters/cryptography/cryptography_adapter.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/commons/domain/checklist_answer_entity.dart';
import 'package:portox_app/app/commons/domain/checklist_entity.dart';
import 'package:portox_app/app/commons/domain/checklist_seal_entity.dart';
import 'package:portox_app/app/commons/domain/checklist_signature_entity.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/create_checklist.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/load_seal.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/load_weighing.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/remove_checklist.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/save_checklist.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/save_seal.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/save_ticket.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/validate_seal.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/supervisor_entity.dart';

part 'step_store.g.dart';

class StepStore = StepStoreBase with _$StepStore;

enum StepStatus { initial, yesLoading, noLoading, success, cancel, error }

abstract class StepStoreBase with Store {
  StepStoreBase(
    this.appStore,
    this.createChecklist,
    this.saveChecklist,
    this.saveTicket,
    this.removeChecklist,
    this.loadWeighing,
    this.cryptography,
    this.validateSeal,
    this.saveSeal,
    this.loadSeal,
  );
  final AppStore appStore;
  final CreateChecklistUseCase createChecklist;
  final SaveChecklistUseCase saveChecklist;
  final SaveTicketUseCase saveTicket;
  final RemoveChecklistUseCase removeChecklist;
  final LoadWeighingUseCase loadWeighing;
  final ICryptographyAdapter cryptography;
  final ValidateSealUseCase validateSeal;
  final SaveSealUseCase saveSeal;
  final LoadSealUseCase loadSeal;

  @observable
  StepStatus status = StepStatus.initial;
  @observable
  Map<String, String> fields = {};
  @observable
  String tag = '';
  @observable
  List<ChecklistSealEntity> seals = [];
  @observable
  List<SupervisorEntity> supervisors = [];
  Locale get userLanguage => appStore.language;

  @observable
  double? weight;
  @observable
  bool enableWeightField = false;
  @observable
  List<FlowStepEntity> steps = [];

  @action
  void setStatus(StepStatus value) => status = value;
  @action
  void setFields(Map<String, String> value) => fields = value;
  @action
  void setWeight(double? value) => weight = value;
  @action
  void setTag(String value) => tag = value;
  @action
  void setEnableWeightField({required bool value}) => enableWeightField = value;
  @action
  void addSeal(ChecklistSealEntity value) => seals.add(value);
  @action
  void removeSeal(int value) => seals.removeAt(value);
  @action
  void setSupervisors(List<SupervisorEntity> value) => supervisors = value;

  @action
  void loadSupervisors() {
    final seen = <String>{};
    final uniqueList = appStore.supervisors
        .where((supervisor) => seen.add(supervisor.description))
        .toList()
      ..sort((a, b) => a.description.compareTo(b.description));

    setSupervisors(uniqueList);
  }

  @action
  Future onSubmitConfirmation({
    required bool accepted,
    required String flowCode,
    required ScheduleEntity schedule,
    required bool hasTag,
    int? compartment,
  }) async {
    if (accepted) {
      setStatus(StepStatus.yesLoading);
    } else {
      setStatus(StepStatus.noLoading);
    }

    if (accepted && hasTag && tag.isNotEmpty) {
      final ticketResult = await saveTicket.call(
        scheduleNumber: schedule.scheduleNumber,
        tag: tag,
      );
    }

    final response = await _createChecklist(
      accepted: accepted,
      flowCode: flowCode,
      scheduleNumber: schedule.scheduleNumber,
      token: appStore.token,
      tag: hasTag ? tag : null,
      compartment: compartment,
    );
    setTag('');
    setStatus(response);
    if (response == StepStatus.initial) {
      if (accepted) {
        await Modular.to.popAndPushNamed(
          '/checklist/?showPositiveMessage=true',
          arguments: schedule,
        );
      } else {
        await Modular.to.popAndPushNamed(
          '/checklist/?showNegativeMessage=true',
          arguments: schedule,
        );
      }
    }
  }

  @action
  Future onSubmitWithQuestions({
    required bool accepted,
    required String flowCode,
    required ScheduleEntity schedule,
    required List<ChecklistAnswerEntity> answers,
    required List<ChecklistSignatureEntity> signatures,
    int? compartment,
  }) async {
    setStatus(StepStatus.yesLoading);
    final response = await _createChecklist(
      flowCode: flowCode,
      scheduleNumber: schedule.scheduleNumber,
      token: appStore.token,
      compartment: compartment,
      accepted: accepted,
      answers: answers,
      signatures: signatures,
    );
    setStatus(response);
    if (response == StepStatus.initial) {
      if (accepted) {
        await Modular.to.popAndPushNamed(
          '/checklist/?showPositiveMessage=true',
          arguments: schedule,
        );
      } else {
        await Modular.to.popAndPushNamed(
          '/checklist/?showNegativeMessage=true',
          arguments: schedule,
        );
      }
    }
  }

  @action
  Future onSubmitWithWeight({
    required bool accepted,
    required String flowCode,
    required ScheduleEntity schedule,
    required int compartment,
    double? weight,
    int? supervisor,
  }) async {
    if (accepted) {
      setStatus(StepStatus.yesLoading);
    } else {
      setStatus(StepStatus.noLoading);
    }
    final response = await _createChecklist(
      flowCode: flowCode,
      scheduleNumber: schedule.scheduleNumber,
      token: appStore.token,
      accepted: accepted,
      weight: weight,
      compartment: compartment,
      supervisor: supervisor,
    );
    setStatus(response);
    if (response == StepStatus.initial) {
      if (accepted) {
        await Modular.to.popAndPushNamed(
          '/checklist/?showPositiveMessage=true',
          arguments: schedule,
        );
      } else {
        await Modular.to.popAndPushNamed(
          '/checklist/?showNegativeMessage=true',
          arguments: schedule,
        );
      }
    }
  }

  @action
  Future onSubmitWithSeals({
    required bool accepted,
    required String flowCode,
    required ScheduleEntity schedule,
    List<ChecklistSealEntity>? seals,
    int? compartment,
  }) async {
    if (accepted) {
      setStatus(StepStatus.yesLoading);
    } else {
      setStatus(StepStatus.noLoading);
    }

    final response = await _createChecklist(
      flowCode: flowCode,
      scheduleNumber: schedule.scheduleNumber,
      token: appStore.token,
      accepted: accepted,
      seals: seals,
      compartment: compartment,
    );
    setStatus(response);
    if (response == StepStatus.initial) {
      if (accepted) {
        await Modular.to.popAndPushNamed(
          '/checklist/?showPositiveMessage=true',
          arguments: schedule,
        );
      } else {
        await Modular.to.popAndPushNamed(
          '/checklist/?showNegativeMessage=true',
          arguments: schedule,
        );
      }
    }
  }

  @action
  Future<String> checkTag(
    String scheduleNumber,
    List<String> codes,
  ) async {
    setStatus(StepStatus.yesLoading);
    if (codes.isEmpty || codes.first.isEmpty) {
      setStatus(StepStatus.initial);
      return '';
    }
    final result = await saveTicket.call(
      scheduleNumber: scheduleNumber,
      tag: codes.first,
    );
    setStatus(StepStatus.initial);
    return result.fold(
      (l) {
        fields[fields.keys.last] = codes.first;
        setFields(fields);
        setTag(codes.first);
        return '';
      },
      (response) {
        if (response.isNotEmpty) {
          fields[fields.keys.last] = '';
          setFields(fields);
          setTag('');
          return response;
        }
        fields[fields.keys.last] = codes.first;
        setFields(fields);
        setTag(codes.first);
        return '';
      },
    );
  }

  @action
  Future<String> checkSeal(
    String scheduleNumber,
    ChecklistSealEntity seal,
    bool hasConnection,
  ) async {
    setStatus(StepStatus.yesLoading);

    var hasSavedSeal = false;

    final savedSeal = await loadSeal.call(seal.code);

    await savedSeal.fold((l) => null, (r) async {
      hasSavedSeal = r;
    });

    if (hasSavedSeal) {
      setStatus(StepStatus.initial);
      if (userLanguage.languageCode.toLowerCase() == 'en') {
        return 'Seal already used';
      } else {
        return 'Lacre já utilizado';
      }
    }

    final result = await validateSeal.call(
      scheduleNumber: scheduleNumber,
      seal: seal.code,
    );

    setStatus(StepStatus.initial);
    return result.fold((l) {
      if (!seals.any((s) => s.code == seal.code)) {
        addSeal(
          ChecklistSealEntity(
            code: seal.code,
            createdAt: seal.createdAt,
          ),
        );
      }
      return '';
    }, (response) {
      if (!seals.any((s) => s.code == seal.code)) {
        addSeal(
          ChecklistSealEntity(
            validated: response.isValid,
            code: seal.code,
            createdAt: seal.createdAt,
          ),
        );
      }
      return response.errorMessage;
    });
  }

  Future<StepStatus> _createChecklist({
    required String flowCode,
    required String scheduleNumber,
    required String token,
    bool accepted = true,
    String? tag,
    double? weight,
    int? compartment,
    int? supervisor,
    List<ChecklistAnswerEntity>? answers,
    List<ChecklistSealEntity>? seals,
    List<ChecklistSignatureEntity>? signatures,
  }) async {
    unawaited(
      createChecklist
          .call(
        ChecklistEntity(
          token: token,
          accepted: accepted,
          flowCode: flowCode,
          scheduleNumber: scheduleNumber,
          tag: tag,
          weight: weight,
          compartment: compartment,
          supervisor: supervisor,
          answers: answers ?? [],
          seals: seals ?? [],
          signatures: signatures ?? [],
          createdAt: DateTime.now().toString(),
        ),
      )
          .then((result) {
        result.fold(
          (e) {
            removeChecklist.call(
              flowCode: flowCode,
              scheduleNumber: scheduleNumber,
              compartment: compartment,
            );
          },
          (r) {},
        );
      }),
    );

    if (accepted) {
      if (flowCode == 'AWAITTING_SCAN_SEAL') {
        if (seals != null) {
          for (var seal in seals) {
            await saveSeal.call(
                sealCode: seal.code, scheduleNumber: scheduleNumber);
          }
        }
      }

      final saveResult = await saveChecklist.call(
        flowCode: flowCode,
        scheduleNumber: scheduleNumber,
        compartment: compartment,
      );
      return saveResult.fold(
        (l) => StepStatus.error,
        (r) => StepStatus.initial,
      );
    }
    return StepStatus.initial;
  }

  String getAnswerDescription(AnswerEntity answer) {
    if (userLanguage.languageCode.toLowerCase() == 'en') {
      return answer.enUS;
    }
    if (userLanguage.languageCode.toLowerCase() == 'es') {
      return answer.esES;
    }
    return answer.ptBR;
  }

  String getQuestionDescription(QuestionEntity question) {
    if (userLanguage.languageCode.toLowerCase() == 'en') {
      return question.enUS;
    }
    if (userLanguage.languageCode.toLowerCase() == 'es') {
      return question.esES;
    }
    return question.ptBR;
  }

  String getSignatureDescription(SignatureEntity signature) {
    if (userLanguage.languageCode.toLowerCase() == 'en') {
      return signature.responsibleUs;
    }
    if (userLanguage.languageCode.toLowerCase() == 'es') {
      return signature.responsibleEs;
    }
    return signature.responsiblePt;
  }

  @action
  Future<bool> confirmSupervisorPassword(
    SupervisorEntity supervisor,
    String password,
  ) async {
    final hashedPassword = await cryptography
        .hash('${supervisor.username.toUpperCase()}$password');
    return hashedPassword.toUpperCase() == supervisor.password;
  }

  @action
  Future<void> loadWeight({
    required String scheduleNumber,
    required String compartment,
    required String flowCode,
  }) async {
    setStatus(StepStatus.yesLoading);
    final result = await loadWeighing.call(
      scheduleNumber: scheduleNumber,
      compartment: compartment,
      flowCode: flowCode,
    );
    result.fold(
      (l) {
        setWeight(null);
        setEnableWeightField(value: true);
        setStatus(StepStatus.error);
      },
      (response) {
        response.weight == 0
            ? setEnableWeightField(value: true)
            : setEnableWeightField(value: false);
        final fieldsWithWeight = fields;
        fieldsWithWeight[fieldsWithWeight.keys.last] = '${response.weight}';
        setFields(fieldsWithWeight);
        setWeight(response.weight);
        setStatus(StepStatus.success);
      },
    );
  }
}
