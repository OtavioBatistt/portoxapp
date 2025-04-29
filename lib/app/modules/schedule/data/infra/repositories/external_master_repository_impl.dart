import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/api_datasource.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_answers_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_flow_steps_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_occurrence_types_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_questions_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_signatures_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/external_repository.dart';

class ExternalMasterRepository
    implements
        ILoadExternalFlowStepsRepository,
        ILoadExternalAnswersRepository,
        ILoadExternalQuestionsRepository,
        ILoadExternalOccurrenceTypesRepository,
        ILoadExternalSignaturesRepository {
  ExternalMasterRepository({
    required ILoadFlowStepsDataSource flowStepsDataSource,
    required ILoadAnswersDataSource answersDataSource,
    required ILoadQuestionsDataSource questionsDataSource,
    required ILoadOccurrenceTypesDataSource occurrenceTypesDataSource,
    required ILoadSignaturesDataSource signaturesDataSource,
  })  : _flowStepsDataSource = flowStepsDataSource,
        _answersDataSource = answersDataSource,
        _questionsDataSource = questionsDataSource,
        _occurrenceTypesDataSource = occurrenceTypesDataSource,
        _signaturesDataSource = signaturesDataSource;

  final ILoadFlowStepsDataSource _flowStepsDataSource;
  final ILoadAnswersDataSource _answersDataSource;
  final ILoadQuestionsDataSource _questionsDataSource;
  final ILoadOccurrenceTypesDataSource _occurrenceTypesDataSource;
  final ILoadSignaturesDataSource _signaturesDataSource;

  @override
  Future<Either<Failure, ExternalFlowStepsResponseEntity>> loadFlowSteps({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final response = await _flowStepsDataSource.loadFlowSteps(
        deviceSerial: deviceSerial,
        isInitialLoad: isInitialLoad,
      );
      return right(response);
    } on Exception {
      return left(ClientError());
    }
  }

  @override
  Future<Either<Failure, ExternalAnswersResponseEntity>> loadAnswers({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final response = await _answersDataSource.loadAnswers(
        deviceSerial: deviceSerial,
        isInitialLoad: isInitialLoad,
      );
      return right(response);
    } on Exception {
      return left(ClientError());
    }
  }

  @override
  Future<Either<Failure, ExternalQuestionsResponseEntity>> loadQuestions({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final response = await _questionsDataSource.loadQuestions(
        deviceSerial: deviceSerial,
        isInitialLoad: isInitialLoad,
      );
      return right(response);
    } on Exception {
      return left(ClientError());
    }
  }

  @override
  Future<Either<Failure, ExternalSignaturesResponseEntity>> loadSignatures({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final response = await _signaturesDataSource.loadSignatures(
        deviceSerial: deviceSerial,
        isInitialLoad: isInitialLoad,
      );
      return right(response);
    } on Exception {
      return left(ClientError());
    }
  }

  @override
  Future<Either<Failure, ExternalOccurrenceTypesResponseEntity>>
      loadOccurrenceTypes({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final response = await _occurrenceTypesDataSource.loadOccurrenceTypes(
        deviceSerial: deviceSerial,
        isInitialLoad: isInitialLoad,
      );
      return right(response);
    } on Exception {
      return left(ClientError());
    }
  }
}
