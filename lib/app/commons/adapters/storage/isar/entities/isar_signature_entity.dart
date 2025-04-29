import 'package:isar/isar.dart';

part 'isar_signature_entity.g.dart';

@Collection()
class IsarSignatureEntity {
  int id = Isar.autoIncrement;

  int? signatureId;
  int? docSignatureId;
  int? sequence;
  String? responsiblePt;
  String? responsibleUs;
  String? responsibleEs;
  bool? required;
  String? flowCode;
  String? operation;
  String? loadType;
}
