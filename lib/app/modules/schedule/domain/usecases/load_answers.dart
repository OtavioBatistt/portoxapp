import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_answers_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/external_repository.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LoadAndSaveAnswersUseCase {
  LoadAndSaveAnswersUseCase({
    required ILoadExternalAnswersRepository loadExternalAnswers,
    required ILoadLocalAnswersRepository loadLocalAnswers,
    required IUpdateLocalAnswersRepository updateLocalAnswers,
  })  : _loadLocalAnswers = loadLocalAnswers,
        _updateLocalAnswers = updateLocalAnswers,
        _loadExternalAnswers = loadExternalAnswers;

  final ILoadExternalAnswersRepository _loadExternalAnswers;
  final ILoadLocalAnswersRepository _loadLocalAnswers;
  final IUpdateLocalAnswersRepository _updateLocalAnswers;

  Future<Either<Failure, List<AnswerEntity>>> call(
    String deviceSerial,
  ) async {
    final localResult = await _loadLocalAnswers.loadAnswers();
    final local = localResult.fold((e) => e, (r) => r);
    if (localResult.isLeft()) {
      return left(local as Failure);
    }

    final externalResult = await _loadExternalAnswers.loadAnswers(
      deviceSerial: deviceSerial,
      isInitialLoad: (local as List<AnswerEntity>).isEmpty,
    );
    final external = externalResult.fold((e) => e, (r) => r);
    if (externalResult.isLeft()) {
      return left(external as Failure);
    }

    final answerList = local;
    for (final removeItem
        in (external as ExternalAnswersResponseEntity).removeList) {
      answerList.removeWhere((answer) => answer.id == removeItem);
    }
    for (final updateItem in external.updateList) {
      answerList
        ..removeWhere((answer) => answer.id == updateItem.id)
        ..add(updateItem);
    }
    if (external.removeList.isNotEmpty || external.updateList.isNotEmpty) {
      await _updateLocalAnswers.updateAnswers(answerList);
    }
    return right(answerList);
  }
}
