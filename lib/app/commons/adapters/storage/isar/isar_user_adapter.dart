import 'package:isar/isar.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_answer_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_seal_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_credentials_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_flow_steps_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_type_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_question_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_schedule_driver_phone_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_signature_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/storage_user_adapter.dart';

class IsarCredentialsAdapter implements ILocalStorageAdapter {
  IsarCredentialsAdapter(this.isar);
  final Isar isar;

  @override
  Future<void> saveCredentials(IsarCredentialsEntity user) async {
    await isar.writeTxn((_) async {
      await isar.isarCredentialsEntitys.put(user);
    });
  }

  @override
  Future<void> clear() async {
    await isar.isarCredentialsEntitys.where().findAll();
  }

  @override
  Future<void> saveFlowSteps(List<IsarFlowStepsEntity> flowSteps) async {
    await isar.writeTxn((_) async {
      await isar.isarFlowStepsEntitys.clear();
      for (final flowStep in flowSteps) {
        await isar.isarFlowStepsEntitys.put(flowStep);
      }
    });
  }

  @override
  Future<List<IsarFlowStepsEntity>> loadFlowSteps() async =>
      isar.isarFlowStepsEntitys.where().findAll();

  @override
  Future<void> saveChecklist(IsarChecklistEntity checklist) async {
    await isar.writeTxn((_) async {
      await isar.isarChecklistEntitys.put(checklist);
    });
  }

  @override
  Future<void> removeChecklist(IsarChecklistEntity checklist) async {
    final removeItem = await isar.isarChecklistEntitys
        .filter()
        .scheduleNumberEqualTo(checklist.scheduleNumber)
        .and()
        .flowCodeEqualTo(checklist.flowCode)
        .and()
        .compartmentEqualTo(checklist.compartment)
        .findFirst();
    if (removeItem != null) {
      await isar.writeTxn((_) async {
        await isar.isarChecklistEntitys.delete(removeItem.id);
      });
    }
  }

  @override
  Future<List<IsarChecklistEntity>> loadChecklists(String scheduleNumber) =>
      isar.isarChecklistEntitys
          .filter()
          .scheduleNumberEqualTo(scheduleNumber)
          .findAll();

  @override
  Future<List<IsarAnswerEntity>> loadAnswers() async =>
      isar.isarAnswerEntitys.where().findAll();

  @override
  Future<List<IsarQuestionEntity>> loadQuestions() async =>
      isar.isarQuestionEntitys.where().findAll();

  @override
  Future<void> saveAnswers(List<IsarAnswerEntity> answers) async {
    await isar.writeTxn((_) async {
      await isar.isarAnswerEntitys.clear();
      for (final answer in answers) {
        await isar.isarAnswerEntitys.put(answer);
      }
    });
  }

  @override
  Future<void> saveQuestions(List<IsarQuestionEntity> questions) async {
    await isar.writeTxn((_) async {
      await isar.isarQuestionEntitys.clear();
      for (final question in questions) {
        await isar.isarQuestionEntitys.put(question);
      }
    });
  }

  @override
  Future<List<IsarOccurrenceTypeEntity>> loadOccurrenceTypes() async =>
      isar.isarOccurrenceTypeEntitys.where().findAll();

  @override
  Future<List<IsarSignatureEntity>> loadSignatures() async =>
      isar.isarSignatureEntitys.where().findAll();

  @override
  Future<void> saveOccurrenceTypes(
    List<IsarOccurrenceTypeEntity> occurrenceTypes,
  ) async {
    await isar.writeTxn((_) async {
      await isar.isarOccurrenceTypeEntitys.clear();
      for (final occurrence in occurrenceTypes) {
        await isar.isarOccurrenceTypeEntitys.put(occurrence);
      }
    });
  }

  @override
  Future<void> saveSignatures(List<IsarSignatureEntity> signatures) async {
    await isar.writeTxn((_) async {
      await isar.isarSignatureEntitys.clear();
      for (final signature in signatures) {
        await isar.isarSignatureEntitys.put(signature);
      }
    });
  }

  @override
  Future<List<IsarOccurrenceEntity>> loadOccurrences() async =>
      isar.isarOccurrenceEntitys.where().findAll();

  @override
  Future<void> saveOccurrence(
    IsarOccurrenceEntity occurrence,
  ) async {
    await isar.writeTxn((_) async {
      await isar.isarOccurrenceEntitys.put(occurrence);
    });
  }

  @override
  Future<void> saveChecklistSeal(IsarChecklistSealEntity params) async {
    await isar.writeTxn((_) async {
      await isar.isarChecklistSealEntitys.put(params);
    });
  }

  @override
  Future<bool> loadChecklistSeal(String sealCode) async {
    var result = await isar.isarChecklistSealEntitys
        .filter()
        .sealCodeEqualTo(sealCode)
        .findFirst();
    return result != null;
  }

  @override
  Future<IsarScheduleDriverPhoneEntity?> loadDriverPhone(
      String scheduleNumber) async {
    var result = await isar.isarScheduleDriverPhoneEntitys
        .filter()
        .scheduleNumberEqualTo(scheduleNumber)
        .findFirst();
    return result;
  }

  @override
  Future<void> saveDriverPhone(IsarScheduleDriverPhoneEntity params) async {
    await isar.writeTxn((_) async {
      var existingEntity = await isar.isarScheduleDriverPhoneEntitys
          .filter()
          .scheduleNumberEqualTo(params.scheduleNumber)
          .findFirst();

      if (existingEntity != null) {
        existingEntity.driverPhone = params.driverPhone;
        existingEntity.messageCount = params.messageCount;
        await isar.isarScheduleDriverPhoneEntitys.put(existingEntity);
      } else {
        await isar.isarScheduleDriverPhoneEntitys.put(params);
      }
    });
  }
}
