import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';

class ScheduleEntity {
  const ScheduleEntity({
    required this.window,
    required this.lines,
    this.id = '',
    this.scheduleNumber = '',
    this.plantCode = '',
    this.plantDescription = '',
    this.plantAddress = '',
    this.operationType = '',
    this.operationDescription = '',
    this.windowHourAndMinute = '',
    this.carrierDoc = '',
    this.carrierName = '',
    this.carrierDocValid,
    this.truckPlate = '',
    this.trailerPlate = '',
    this.trailer2Plate = '',
    this.trailer3Plate = '',
    this.driverDoc = '',
    this.driverName = '',
    this.location = '',
    this.queryString = '',
    this.totalAxes,
    this.capacityWeight,
    this.capacityVolume,
    this.marketType = '',
    this.marketTypeDescr = '',
    this.windowType = '',
    this.locationGroup = '',
    this.locationGroupDescr = '',
    this.operation = '',
    this.loadType = '',
    this.balanceTag = false,
    this.showEnabled = false,
  });
  final String id;
  final String scheduleNumber;
  final String plantCode;
  final String plantDescription;
  final String plantAddress;
  final String operationType;
  final String operationDescription;
  final DateTime window;
  final String windowHourAndMinute;
  final String carrierDoc;
  final String carrierName;
  final bool? carrierDocValid;
  final bool balanceTag;
  final String truckPlate;
  final String trailerPlate;
  final String trailer2Plate;
  final String trailer3Plate;
  final int? totalAxes;
  final int? capacityWeight;
  final int? capacityVolume;
  final String driverDoc;
  final String driverName;
  final String location;
  final String queryString;
  final List<LineEntity> lines;
  final String marketType;
  final String marketTypeDescr;
  final String windowType;
  final String locationGroup;
  final String locationGroupDescr;
  final String operation;
  final String loadType;
  final bool showEnabled;

  static Future<ScheduleEntity?> fromFirebaseMap(
      String id, Map<String, dynamic>? map) async {
    if (map == null) {
      return null;
    }

    return ScheduleEntity(
      id: id,
      scheduleNumber: map['scheduleNumber'] ?? '',
      plantCode: map['plantCode'] ?? '',
      plantDescription: map['plantDescr'] ?? '',
      plantAddress: map['plantAddress'] ?? '',
      operationType: map['operationType'] ?? '',
      operationDescription: map['operationDescr'] ?? '',
      window: map['windows_date'],
      windowHourAndMinute: map['windows_hour_minute'] ?? '',
      carrierDoc: map['carrierDoc'] ?? '',
      carrierName: map['carrierName'] ?? '',
      carrierDocValid: map['carrierDocValid'],
      truckPlate: map['truckPlate'] ?? '',
      trailerPlate: map['trailerPlate'] ?? '',
      trailer2Plate: map['trailer2Plate'] ?? '',
      trailer3Plate: map['trailer3Plate'] ?? '',
      totalAxes: int.parse(map['totalAxes'] ?? '0'),
      capacityWeight: int.parse(map['capacityWeight'] ?? '0'),
      capacityVolume: map['capacityVolume'],
      driverDoc: map['driverDoc'] ?? '',
      driverName: map['driverName'] ?? '',
      location: map['location'] ?? '',
      queryString: map['queryString'] ?? '',
      lines: map['lineList'],
      marketType: map['marketType'] ?? '',
      marketTypeDescr: map['marketTypeDescr'] ?? '',
      windowType: map['windowType'] ?? '',
      locationGroup: map['locationGroup'] ?? '',
      locationGroupDescr: map['locationGroupDescr'] ?? '',
      operation: map['operation'] ?? '',
      loadType: map['loadType'] ?? '',
      balanceTag: map['balanceTag'] ?? false,
      showEnabled: map['showEnabled'] ?? false,
    );
  }

  String formatWindowAndLocation(BuildContext context) {
    final day = window.day;
    final month = intl(context, 'app.month-${window.month}');
    final year = window.year;
    final hour = window.hour;
    final minute = window.minute;
    final weekday = intl(context, 'app.weekday-${window.weekday}');
    return '$day-$month-$year $hour:$minute ($weekday) - $location';
  }
}
