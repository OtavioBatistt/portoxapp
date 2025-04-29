import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/occurrence_type_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';

abstract class IUpdateLocalFlowStepsRepository {
  Future<Either<Failure, void>> updateFlowSteps(List<FlowStepEntity> params);
}

abstract class ILoadLocalFlowStepsRepository {
  Future<Either<Failure, List<FlowStepEntity>>> loadFlowSteps();
}

abstract class IUpdateLocalQuestionsRepository {
  Future<Either<Failure, void>> updateQuestions(List<QuestionEntity> params);
}

abstract class ILoadLocalQuestionsRepository {
  Future<Either<Failure, List<QuestionEntity>>> loadQuestions();
}

abstract class IUpdateLocalAnswersRepository {
  Future<Either<Failure, void>> updateAnswers(List<AnswerEntity> params);
}

abstract class ILoadLocalAnswersRepository {
  Future<Either<Failure, List<AnswerEntity>>> loadAnswers();
}

abstract class IUpdateLocalOccurrenceTypesRepository {
  Future<Either<Failure, void>> updateOccurrenceTypes(
    List<OccurrenceTypeEntity> params,
  );
}

abstract class ILoadLocalOccurrenceTypesRepository {
  Future<Either<Failure, List<OccurrenceTypeEntity>>> loadOccurrenceTypes();
}

abstract class IUpdateLocalSignaturesRepository {
  Future<Either<Failure, void>> updateSignatures(List<SignatureEntity> params);
}

abstract class ILoadLocalSignaturesRepository {
  Future<Either<Failure, List<SignatureEntity>>> loadSignatures();
}
