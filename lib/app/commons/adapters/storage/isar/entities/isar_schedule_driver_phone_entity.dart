import 'package:isar/isar.dart';

part 'isar_schedule_driver_phone_entity.g.dart';

@Collection()
class IsarScheduleDriverPhoneEntity {
  int id = Isar.autoIncrement;

  String? driverPhone;
  String? scheduleNumber;
  int? messageCount;
}
