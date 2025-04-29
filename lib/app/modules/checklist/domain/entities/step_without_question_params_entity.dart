import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

class StepWithoutQuestionParamsEntity {
  StepWithoutQuestionParamsEntity({
    required this.icon,
    required this.step,
    required this.schedule,
    required this.flowStep,
    required this.confirmationLabel,
    required this.fields,
    required this.hasTag,
    required this.executedCompartments,
  });

  String icon;
  String? step;
  ScheduleEntity schedule;
  FlowStepEntity flowStep;
  String confirmationLabel;
  Map<String, String> fields;
  bool hasTag;
  List<int> executedCompartments;
}
