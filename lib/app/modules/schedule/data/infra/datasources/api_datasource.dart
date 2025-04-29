import 'package:portox_app/app/modules/schedule/domain/entities/external_answers_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_flow_steps_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_occurrence_types_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_questions_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_signatures_response_entity.dart';

abstract class ILoadFlowStepsDataSource {
  Future<ExternalFlowStepsResponseEntity> loadFlowSteps({
    String deviceSerial,
    bool isInitialLoad,
  });
}

abstract class ILoadQuestionsDataSource {
  Future<ExternalQuestionsResponseEntity> loadQuestions({
    String deviceSerial,
    bool isInitialLoad,
  });
}

abstract class ILoadAnswersDataSource {
  Future<ExternalAnswersResponseEntity> loadAnswers({
    String deviceSerial,
    bool isInitialLoad,
  });
}

abstract class ILoadOccurrenceTypesDataSource {
  Future<ExternalOccurrenceTypesResponseEntity> loadOccurrenceTypes({
    String deviceSerial,
    bool isInitialLoad,
  });
}

abstract class ILoadSignaturesDataSource {
  Future<ExternalSignaturesResponseEntity> loadSignatures({
    String deviceSerial,
    bool isInitialLoad,
  });
}
