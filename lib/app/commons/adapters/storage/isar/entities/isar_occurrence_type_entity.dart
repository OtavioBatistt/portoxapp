import 'package:isar/isar.dart';

part 'isar_occurrence_type_entity.g.dart';

@Collection()
class IsarOccurrenceTypeEntity {
  int id = Isar.autoIncrement;

  String? occurrenceId;
  int? classificId;
  String? classificCodePt;
  String? classificCodeUs;
  String? classificCodeEs;
  String? profileCode;
  String? profileName;
  bool? required;
  String? operationType;
}
