import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_answers_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_flow_steps_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_occurrence_types_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_questions_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_signatures_response_entity.dart';

abstract class ILoadExternalFlowStepsRepository {
  Future<Either<Failure, ExternalFlowStepsResponseEntity>> loadFlowSteps({
    String deviceSerial,
    bool isInitialLoad,
  });
}

abstract class ILoadExternalQuestionsRepository {
  Future<Either<Failure, ExternalQuestionsResponseEntity>> loadQuestions({
    String deviceSerial,
    bool isInitialLoad,
  });
}

abstract class ILoadExternalAnswersRepository {
  Future<Either<Failure, ExternalAnswersResponseEntity>> loadAnswers({
    String deviceSerial,
    bool isInitialLoad,
  });
}

abstract class ILoadExternalOccurrenceTypesRepository {
  Future<Either<Failure, ExternalOccurrenceTypesResponseEntity>>
      loadOccurrenceTypes({
    String deviceSerial,
    bool isInitialLoad,
  });
}

abstract class ILoadExternalSignaturesRepository {
  Future<Either<Failure, ExternalSignaturesResponseEntity>> loadSignatures({
    String deviceSerial,
    bool isInitialLoad,
  });
}
