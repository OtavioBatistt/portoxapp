import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';

class StepWithQuestionParamsEntity {
  StepWithQuestionParamsEntity({
    required this.icon,
    required this.step,
    required this.schedule,
    required this.flowStep,
    required this.questions,
    required this.answers,
    required this.signatures,
    required this.executedCompartments,
  });
  String icon;
  String? step;
  ScheduleEntity schedule;
  FlowStepEntity flowStep;
  List<QuestionEntity> questions;
  List<AnswerEntity>? answers;
  List<SignatureEntity>? signatures;
  List<int> executedCompartments;
}
