import 'package:isar/isar.dart';

part 'isar_flow_steps_entity.g.dart';

@Collection()
class IsarFlowStepsEntity {
  int id = Isar.autoIncrement;

  String? flowStepId;
  String? plantCode;
  String? plantDescription;
  String? profileCode;
  String? profileName;
  String? operationType;
  String? locationGroup;
  String? windowType;
  double? sequence;
  String? flowCode;
  String? flowDescription;
  String? iconName;
  bool? compartmented;
  bool? signatures;
  bool? questions;
  bool? skippable;
  String? flowTime;
}
