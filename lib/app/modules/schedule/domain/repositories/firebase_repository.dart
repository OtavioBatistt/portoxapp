import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_flow_steps_response_entity.dart';

abstract class ILoadFlowStepsRepository {
  Future<Either<Failure, ExternalFlowStepsResponseEntity>> loadFlowSteps({
    String deviceSerial,
    bool isInitialLoad,
  });
}

abstract class ILoadQuestionsRepository {
  Future<Either<Failure, List<QuestionEntity>>> loadQuestions(
    String deviceSerial,
  );
}

abstract class ILoadAnswersRepository {
  Future<Either<Failure, List<AnswerEntity>>> loadAnswers(String deviceSerial);
}

abstract class ILoadSchedulesRepository {
  Future<Either<Failure, StreamSubscription>> loadSchedules(
    Function(List<ScheduleEntity>) onListenChange, {
    int? limit,
    List<String>? plantCodes,
  });
}
