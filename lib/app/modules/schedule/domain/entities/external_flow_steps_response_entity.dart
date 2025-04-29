import 'package:portox_app/app/commons/domain/flow_step_entity.dart';

class ExternalFlowStepsResponseEntity {
  ExternalFlowStepsResponseEntity(
      {required this.removeList, required this.updateList});

  List<FlowStepEntity> updateList;
  List<String> removeList;
}
