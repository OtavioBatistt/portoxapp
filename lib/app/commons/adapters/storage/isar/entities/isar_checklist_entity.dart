import 'package:isar/isar.dart';

part 'isar_checklist_entity.g.dart';

@Collection()
class IsarChecklistEntity {
  int id = Isar.autoIncrement;

  String? flowCode;
  String? scheduleNumber;
  int? compartment;
}
