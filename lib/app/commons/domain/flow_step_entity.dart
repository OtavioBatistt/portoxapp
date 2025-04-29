import 'package:portox_app/app/commons/styles/tokens.dart';

class FlowStepEntity {
  const FlowStepEntity({
    this.id = '',
    this.plantCode = '',
    this.plantDescription = '',
    this.profileCode = '',
    this.profileName = '',
    this.operationType = '',
    this.locationGroup = '',
    this.windowType = '',
    this.sequence = 0,
    this.flowCode = '',
    this.flowDescription = '',
    this.operation = '',
    this.loadType = '',
    this.iconName = '',
    this.compartmented = false,
    this.signatures = false,
    this.questions = false,
    this.weighing = false,
    this.skippable = false,
    this.flowTime = '',
  });

  final String id;
  final String plantCode;
  final String plantDescription;
  final String profileCode;
  final String profileName;
  final String operationType;
  final String locationGroup;
  final String windowType;
  final double sequence;
  final String flowCode;
  final String flowDescription;
  final String operation;
  final String loadType;
  final String iconName;
  final bool compartmented;
  final bool signatures;
  final bool questions;
  final bool weighing;
  final bool skippable;
  final String flowTime;

  static FlowStepEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return FlowStepEntity(
      id: map['id'] ?? '',
      plantCode: map['plant_code'] ?? '',
      plantDescription: map['plant_descr'] ?? '',
      profileCode: map['profile_code'] ?? '',
      profileName: map['profile_name'] ?? '',
      operationType: map['operation_type'] ?? '',
      locationGroup: map['location_group'] ?? '',
      windowType: map['window_type'] ?? '',
      sequence: map['sequence'].toDouble(),
      flowCode: map['flow_code'] ?? '',
      flowDescription: map['flow_descr'] ?? '',
      operation: map['operation'] ?? '',
      loadType: map['load_type'] ?? '',
      compartmented: map['compartmented'],
      signatures: map['signatures'],
      questions: map['questions'],
      iconName: map['icon_name'],
      skippable: map['skippable'] ?? false,
      flowTime: map['flow_time'] ?? '',
    );
  }

  String getIcon() {
    switch (iconName) {
      case 'icon_clipboard_checked':
        return Ox.assets.iconClipboardChecked;
      case 'icon_forklift':
        return Ox.assets.iconForklift;
      case 'icon_truck_entry':
        return Ox.assets.iconTruckEntry;
      case 'icon_truck_exit':
        return Ox.assets.iconTruckExit;
      case 'icon_truck_release':
        return Ox.assets.iconTruckRelease;
      case 'icon_scanner':
        return Ox.assets.iconScanner;
      case 'icon_weighing':
        return Ox.assets.iconWeighing;

      default:
        return Ox.assets.iconScanner;
    }
  }

  String getLabel() => flowDescription.split(' - ').first;

  String? getStep() {
    final divided = flowDescription.split(' - ');
    return divided.length > 1 ? divided.last : null;
  }
}
