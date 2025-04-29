import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_answer_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/save_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LocalAnswersRepository
    implements IUpdateLocalAnswersRepository, ILoadLocalAnswersRepository {
  LocalAnswersRepository({
    required ISaveAnswersDataSource saveAnswers,
    required ILoadLocalAnswersDataSource loadAnswers,
  })  : _loadAnswers = loadAnswers,
        _saveAnswers = saveAnswers;

  final ISaveAnswersDataSource _saveAnswers;
  final ILoadLocalAnswersDataSource _loadAnswers;

  @override
  Future<Either<Failure, void>> updateAnswers(
    List<AnswerEntity> answers,
  ) async {
    try {
      final list = <IsarAnswerEntity>[];
      for (final answer in answers) {
        list.add(
          IsarAnswerEntity()
            ..answerId = answer.id
            ..plantCode = answer.plantCode
            ..validationType = answer.validationType
            ..itemId = answer.itemId
            ..code = answer.code
            ..ptBR = answer.ptBR
            ..enUS = answer.enUS
            ..esES = answer.esES
            ..warehouseCode = answer.warehouseCode,
        );
      }

      await _saveAnswers.saveAnswers(list);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }

  @override
  Future<Either<Failure, List<AnswerEntity>>> loadAnswers() async {
    try {
      final answers = await _loadAnswers.loadAnswers();

      final list = <AnswerEntity>[];
      for (final answer in answers) {
        list.add(AnswerEntity(
          id: answer.answerId ?? '',
          plantCode: answer.plantCode ?? '',
          validationType: answer.validationType ?? '',
          itemId: answer.itemId ?? 0,
          code: answer.code ?? '',
          ptBR: answer.ptBR ?? '',
          enUS: answer.enUS ?? '',
          esES: answer.esES ?? '',
          warehouseCode: answer.warehouseCode ?? '',
        ));
      }
      return right(list);
    } on Exception {
      return left(ClientError());
    }
  }
}
