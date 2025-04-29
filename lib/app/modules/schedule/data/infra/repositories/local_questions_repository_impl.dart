import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_question_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/save_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LocalQuestionsRepository
    implements IUpdateLocalQuestionsRepository, ILoadLocalQuestionsRepository {
  LocalQuestionsRepository({
    required ISaveQuestionsDataSource saveQuestions,
    required ILoadLocalQuestionsDataSource loadQuestions,
  })  : _loadQuestions = loadQuestions,
        _saveQuestions = saveQuestions;

  final ISaveQuestionsDataSource _saveQuestions;
  final ILoadLocalQuestionsDataSource _loadQuestions;

  @override
  Future<Either<Failure, void>> updateQuestions(
    List<QuestionEntity> questions,
  ) async {
    try {
      final list = <IsarQuestionEntity>[];
      for (final question in questions) {
        list.add(
          IsarQuestionEntity()
            ..questionId = question.questionId
            ..plantCode = question.plantCode
            ..flowCode = question.flowCode
            ..operationType = question.operationType
            ..sequence = question.sequence
            ..ptBR = question.ptBR
            ..enUS = question.enUS
            ..esES = question.esES
            ..validationType = question.validationType
            ..required = question.required
            ..confirmationRequired = question.confirmationRequired
            ..marketType = question.marketType
            ..classRisk = question.classRisk,
        );
      }

      await _saveQuestions.saveQuestions(list);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }

  @override
  Future<Either<Failure, List<QuestionEntity>>> loadQuestions() async {
    try {
      final questions = await _loadQuestions.loadQuestions();

      final list = <QuestionEntity>[];
      for (final question in questions) {
        list.add(QuestionEntity(
          questionId: question.questionId ?? 0,
          plantCode: question.plantCode ?? '',
          flowCode: question.flowCode ?? '',
          operationType: question.operationType ?? '',
          sequence: question.sequence ?? 0,
          ptBR: question.ptBR ?? '',
          enUS: question.enUS ?? '',
          esES: question.esES ?? '',
          validationType: question.validationType ?? '',
          required: question.required ?? false,
          confirmationRequired: question.confirmationRequired ?? false,
          marketType: question.marketType ?? '',
          classRisk: question.classRisk ?? false,
        ));
      }
      return right(list);
    } on Exception {
      return left(ClientError());
    }
  }
}
