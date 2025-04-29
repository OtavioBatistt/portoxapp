// ignore_for_file: avoid_dynamic_calls

import 'package:portox_app/app/commons/adapters/http_client/http_client_adapter.dart';

import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/occurrence_type_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/api_datasource.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_answers_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_flow_steps_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_occurrence_types_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_questions_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_signatures_response_entity.dart';

class ApiMasterDataSource
    implements
        ILoadFlowStepsDataSource,
        ILoadQuestionsDataSource,
        ILoadOccurrenceTypesDataSource,
        ILoadSignaturesDataSource,
        ILoadAnswersDataSource {
  ApiMasterDataSource({
    required IHttpClientAdapter client,
  }) : _client = client;

  final IHttpClientAdapter _client;

  @override
  Future<ExternalAnswersResponseEntity> loadAnswers({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final initialLoad = isInitialLoad ? 'Y' : 'N';
      final result = await _client.get<Map<String, dynamic>>(
        '/masterData/answers/$deviceSerial/$initialLoad',
      );
      final List<String> removeList =
          result.data!['delete_answers'].cast<String>();
      final updateList = <AnswerEntity>[];
      for (final doc in result.data!['answers']) {
        updateList.add(AnswerEntity.fromMap(doc)!);
      }
      return ExternalAnswersResponseEntity(
        removeList: removeList,
        updateList: updateList,
      );
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<ExternalQuestionsResponseEntity> loadQuestions({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final initialLoad = isInitialLoad ? 'Y' : 'N';
      final result = await _client.get<Map<String, dynamic>>(
        '/masterData/questions/$deviceSerial/$initialLoad',
      );
      final List<String> removeList =
          result.data!['delete_questions'].cast<String>();
      final updateList = <QuestionEntity>[];
      for (final doc in result.data!['questions']) {
        updateList.add(QuestionEntity.fromMap(doc)!);
      }
      return ExternalQuestionsResponseEntity(
        removeList: removeList,
        updateList: updateList,
      );
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<ExternalFlowStepsResponseEntity> loadFlowSteps({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final initialLoad = isInitialLoad ? 'Y' : 'N';
      final result = await _client.get<Map<String, dynamic>>(
        '/masterData/flowSteps/$deviceSerial/$initialLoad',
      );
      final List<String> removeList =
          result.data!['delete_flow_steps'].cast<String>();
      final updateList = <FlowStepEntity>[];
      for (final doc in result.data!['flow_steps']) {
        updateList.add(FlowStepEntity.fromMap(doc)!);
      }
      return ExternalFlowStepsResponseEntity(
        removeList: removeList,
        updateList: updateList,
      );
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<ExternalOccurrenceTypesResponseEntity> loadOccurrenceTypes({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final initialLoad = isInitialLoad ? 'Y' : 'N';
      final result = await _client.get<Map<String, dynamic>>(
        '/masterData/occurrences/$deviceSerial/$initialLoad',
      );
      final List<String> removeList =
          result.data!['delete_occurrences'].cast<String>();
      final updateList = <OccurrenceTypeEntity>[];
      for (final doc in result.data!['occurrences']) {
        updateList.add(OccurrenceTypeEntity.fromMap(doc)!);
      }
      return ExternalOccurrenceTypesResponseEntity(
        removeList: removeList,
        updateList: updateList,
      );
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<ExternalSignaturesResponseEntity> loadSignatures({
    String deviceSerial = '',
    bool isInitialLoad = false,
  }) async {
    try {
      final initialLoad = isInitialLoad ? 'Y' : 'N';
      final result = await _client.get<Map<String, dynamic>>(
        '/masterData/signatures/$deviceSerial/$initialLoad',
      );
      final List<String> removeList =
          result.data!['delete_signatures'].cast<String>();
      final updateList = <SignatureEntity>[];
      for (final doc in result.data!['signatures']) {
        updateList.add(SignatureEntity.fromMap(doc)!);
      }
      return ExternalSignaturesResponseEntity(
        removeList: removeList,
        updateList: updateList,
      );
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }
}
