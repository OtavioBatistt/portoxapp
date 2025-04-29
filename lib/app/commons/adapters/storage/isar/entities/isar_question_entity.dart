import 'package:isar/isar.dart';

part 'isar_question_entity.g.dart';

@Collection()
class IsarQuestionEntity {
  int id = Isar.autoIncrement;

  int? questionId;
  String? plantCode;
  String? flowCode;
  String? operationType;
  double? sequence;
  String? ptBR;
  String? enUS;
  String? esES;
  String? validationType;
  bool? required;
  bool? confirmationRequired;
  String? marketType;
  bool? classRisk;
}
