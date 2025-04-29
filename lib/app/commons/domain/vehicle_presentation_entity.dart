import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

class VehiclePresentationEntity {
  VehiclePresentationEntity({required this.schedule, required this.flowStep});

  ScheduleEntity schedule;
  FlowStepEntity flowStep;
}
