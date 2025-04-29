import 'package:isar/isar.dart';

part 'isar_answer_entity.g.dart';

@Collection()
class IsarAnswerEntity {
  int id = Isar.autoIncrement;

  String? answerId;
  String? plantCode;
  String? validationType;
  int? itemId;
  String? code;
  String? ptBR;
  String? enUS;
  String? esES;
  String? warehouseCode;
}
