import 'package:isar/isar.dart';

part 'isar_checklist_seal_entity.g.dart';

@Collection()
class IsarChecklistSealEntity {
  int id = Isar.autoIncrement;

  String? sealCode;
  String? scheduleNumber;
}
