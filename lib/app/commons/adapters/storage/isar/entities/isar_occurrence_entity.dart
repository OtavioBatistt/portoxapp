import 'package:isar/isar.dart';

part 'isar_occurrence_entity.g.dart';

@Collection()
class IsarOccurrenceEntity {
  int id = Isar.autoIncrement;

  String? scheduleNumber;
  String? token;
  String? createdAt;
  String? type;
  String? rncNumber;
  int? lineId;
  String? comments;
}
