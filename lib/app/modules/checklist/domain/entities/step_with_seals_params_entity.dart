import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

class StepWithSealsParamsEntity {
  StepWithSealsParamsEntity({
    required this.icon,
    required this.step,
    required this.schedule,
    required this.flowStep,
    required this.confirmationLabel,
    required this.fields,
    required this.executedCompartments,
  });

  String icon;
  ScheduleEntity schedule;
  String? step;
  FlowStepEntity flowStep;
  String confirmationLabel;
  Map<String, String> fields;
  List<int> executedCompartments;
}
