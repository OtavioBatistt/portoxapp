import 'package:portox_app/app/commons/domain/answer_entity.dart';

class ExternalAnswersResponseEntity {
  ExternalAnswersResponseEntity({
    required this.removeList,
    required this.updateList,
  });

  List<AnswerEntity> updateList;
  List<String> removeList;
}
