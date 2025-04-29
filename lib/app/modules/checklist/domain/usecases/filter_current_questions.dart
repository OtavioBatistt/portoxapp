import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

class FilterCurrentQuestionsUseCase {
  Either<Failure, List<QuestionEntity>> call({
    required List<QuestionEntity> questions,
    required FlowStepEntity flowStep,
    required ScheduleEntity schedule,
  }) {
    final isVehicleChecklist = flowStep.flowCode.contains('VEHICLE');
    final questionList = questions
        .where(
          (question) =>
              question.flowCode == flowStep.flowCode &&
              question.plantCode == flowStep.plantCode &&
              question.marketType == schedule.marketType &&
              (isVehicleChecklist ||
                  question.operationType == flowStep.operationType),
        )
        .toList()
      ..sort((a, b) => a.sequence.compareTo(b.sequence));
    return right(questionList);
  }
}
