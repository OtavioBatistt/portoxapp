import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_answer_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_flow_steps_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_type_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_question_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_signature_entity.dart';

abstract class ISaveAnswersDataSource {
  Future<void> saveAnswers(List<IsarAnswerEntity> params);
}

abstract class ISaveFlowStepsDataSource {
  Future<void> saveFlowSteps(List<IsarFlowStepsEntity> params);
}

abstract class ISaveQuestionsDataSource {
  Future<void> saveQuestions(List<IsarQuestionEntity> params);
}

abstract class ISaveOccurrenceTypesDataSource {
  Future<void> saveOccurrenceTypes(List<IsarOccurrenceTypeEntity> params);
}

abstract class ISaveSignaturesDataSource {
  Future<void> saveSignatures(List<IsarSignatureEntity> params);
}

abstract class ILoadLocalFlowStepsDataSource {
  Future<List<IsarFlowStepsEntity>> loadFlowSteps();
}

abstract class ILoadLocalQuestionsDataSource {
  Future<List<IsarQuestionEntity>> loadQuestions();
}

abstract class ILoadLocalAnswersDataSource {
  Future<List<IsarAnswerEntity>> loadAnswers();
}

abstract class ILoadLocalOccurrenceTypesDataSource {
  Future<List<IsarOccurrenceTypeEntity>> loadOccurrenceTypes();
}

abstract class ILoadLocalSignaturesDataSource {
  Future<List<IsarSignatureEntity>> loadSignatures();
}
