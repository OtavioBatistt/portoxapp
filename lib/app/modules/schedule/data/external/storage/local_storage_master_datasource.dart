import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_answer_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_flow_steps_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_type_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_question_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_schedule_driver_phone_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_signature_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/storage_user_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/save_master_datasource.dart';

class LocalStorageMasterDataSource
    implements
        ISaveFlowStepsDataSource,
        ISaveQuestionsDataSource,
        ISaveAnswersDataSource,
        ISaveOccurrenceTypesDataSource,
        ISaveSignaturesDataSource,
        ILoadLocalFlowStepsDataSource,
        ILoadLocalQuestionsDataSource,
        ILoadLocalAnswersDataSource,
        ILoadLocalOccurrenceTypesDataSource,
        ILoadLocalSignaturesDataSource {
  LocalStorageMasterDataSource({
    required ILocalStorageAdapter storage,
  }) : _storage = storage;

  final ILocalStorageAdapter _storage;

  @override
  Future<void> saveAnswers(List<IsarAnswerEntity> answers) async {
    try {
      await _storage.saveAnswers(answers);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<void> saveFlowSteps(List<IsarFlowStepsEntity> flowSteps) async {
    try {
      await _storage.saveFlowSteps(flowSteps);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<void> saveQuestions(List<IsarQuestionEntity> questions) async {
    try {
      await _storage.saveQuestions(questions);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<void> saveOccurrenceTypes(
    List<IsarOccurrenceTypeEntity> occurrenceTypes,
  ) async {
    try {
      await _storage.saveOccurrenceTypes(occurrenceTypes);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<void> saveSignatures(List<IsarSignatureEntity> signatures) async {
    try {
      await _storage.saveSignatures(signatures);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<List<IsarFlowStepsEntity>> loadFlowSteps() async {
    try {
      return await _storage.loadFlowSteps();
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<List<IsarAnswerEntity>> loadAnswers() async {
    try {
      return await _storage.loadAnswers();
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<List<IsarQuestionEntity>> loadQuestions() async {
    try {
      return await _storage.loadQuestions();
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<List<IsarOccurrenceTypeEntity>> loadOccurrenceTypes() async {
    try {
      return await _storage.loadOccurrenceTypes();
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<List<IsarSignatureEntity>> loadSignatures() async {
    try {
      return await _storage.loadSignatures();
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<void> saveDriverPhone(IsarScheduleDriverPhoneEntity params) async {
    try {
      await _storage.saveDriverPhone(params);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<IsarScheduleDriverPhoneEntity?> loadDriverPhone(String params) async {
    try {
      return await _storage.loadDriverPhone(params);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }
}
