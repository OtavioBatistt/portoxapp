import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_questions_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/external_repository.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LoadAndSaveQuestionsUseCase {
  LoadAndSaveQuestionsUseCase({
    required ILoadExternalQuestionsRepository loadExternalQuestions,
    required ILoadLocalQuestionsRepository loadLocalQuestions,
    required IUpdateLocalQuestionsRepository updateLocalQuestions,
  })  : _loadLocalQuestions = loadLocalQuestions,
        _updateLocalQuestions = updateLocalQuestions,
        _loadExternalQuestions = loadExternalQuestions;

  final ILoadExternalQuestionsRepository _loadExternalQuestions;
  final ILoadLocalQuestionsRepository _loadLocalQuestions;
  final IUpdateLocalQuestionsRepository _updateLocalQuestions;

  Future<Either<Failure, List<QuestionEntity>>> call(
    String deviceSerial,
  ) async {
    final localResult = await _loadLocalQuestions.loadQuestions();
    final local = localResult.fold((e) => e, (r) => r);
    if (localResult.isLeft()) {
      return left(local as Failure);
    }

    final externalResult = await _loadExternalQuestions.loadQuestions(
      deviceSerial: deviceSerial,
      isInitialLoad: (local as List<QuestionEntity>).isEmpty,
    );
    final external = externalResult.fold((e) => e, (r) => r);
    if (externalResult.isLeft()) {
      return left(external as Failure);
    }

    final questionList = local;
    for (final removeItem
        in (external as ExternalQuestionsResponseEntity).removeList) {
      questionList.removeWhere((question) => question.id == removeItem);
    }
    for (final updateItem in external.updateList) {
      questionList
        ..removeWhere((question) => question.id == updateItem.id)
        ..add(updateItem);
    }
    if (external.removeList.isNotEmpty || external.updateList.isNotEmpty) {
      await _updateLocalQuestions.updateQuestions(questionList);
    }
    return right(questionList);
  }
}
