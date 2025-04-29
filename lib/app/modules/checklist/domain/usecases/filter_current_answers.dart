import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

class FilterCurrentAnswersUseCase {
  Either<Failure, List<AnswerEntity>> call({
    required List<AnswerEntity> answers,
    required List<QuestionEntity> questions,
    required ScheduleEntity schedule,
  }) {
    final questionsWithLovType = questions
        .where((element) => element.validationType.startsWith('LOV'))
        .toList();
    final itemIds = schedule.lines.map((line) => line.itemId).toList();
    final warehouses = schedule.lines.map((line) => line.warehouse).toList();
    final answerList = answers.where(
      (answer) {
        final validValidationType = questionsWithLovType.any(
          (question) => question.validationType == answer.validationType,
        );
        final validItemId = answer.itemId == null ||
            answer.itemId == 0 ||
            itemIds.any((id) => id == answer.itemId);
        final validWarehouse = answer.warehouseCode.isEmpty ||
            warehouses.any((warehouse) => warehouse == answer.warehouseCode);
        final validPlantCode =
            answer.plantCode.isEmpty || answer.plantCode == schedule.plantCode;

        return validValidationType &&
            validItemId &&
            validWarehouse &&
            validPlantCode;
      },
    ).toList();
    return right(answerList);
  }
}
