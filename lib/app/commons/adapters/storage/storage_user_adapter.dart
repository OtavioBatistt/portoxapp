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

abstract class ILocalStorageAdapter {
  Future<void> saveCredentials(IsarCredentialsEntity user);
  Future<void> saveChecklist(IsarChecklistEntity checklist);
  Future<void> removeChecklist(IsarChecklistEntity checklist);
  Future<List<IsarChecklistEntity>> loadChecklists(String scheduleNumber);
  Future<void> saveAnswers(List<IsarAnswerEntity> answers);
  Future<void> saveQuestions(List<IsarQuestionEntity> questions);
  Future<void> saveFlowSteps(List<IsarFlowStepsEntity> flowSteps);
  Future<void> saveSignatures(List<IsarSignatureEntity> signatures);
  Future<void> saveOccurrenceTypes(
    List<IsarOccurrenceTypeEntity> occurrenceTypes,
  );
  Future<List<IsarSignatureEntity>> loadSignatures();
  Future<List<IsarOccurrenceTypeEntity>> loadOccurrenceTypes();
  Future<List<IsarFlowStepsEntity>> loadFlowSteps();
  Future<List<IsarQuestionEntity>> loadQuestions();
  Future<List<IsarAnswerEntity>> loadAnswers();
  Future<void> clear();
  Future<void> saveOccurrence(IsarOccurrenceEntity occurrence);
  Future<List<IsarOccurrenceEntity>> loadOccurrences();
  Future<void> saveChecklistSeal(IsarChecklistSealEntity params);
  Future<bool> loadChecklistSeal(String sealCode);
  Future<void> saveDriverPhone(IsarScheduleDriverPhoneEntity params);
  Future<IsarScheduleDriverPhoneEntity?> loadDriverPhone(String scheduleNumber);
}
