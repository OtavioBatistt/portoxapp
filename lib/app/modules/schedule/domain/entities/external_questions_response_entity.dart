import 'package:portox_app/app/commons/domain/question_entity.dart';

class ExternalQuestionsResponseEntity {
  ExternalQuestionsResponseEntity({
    required this.removeList,
    required this.updateList,
  });

  List<QuestionEntity> updateList;
  List<String> removeList;
}
