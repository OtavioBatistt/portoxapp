import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/modules/occurrence/domain/repositories/local_storage_repository.dart';

class LoadOccurrencesUseCase {
  LoadOccurrencesUseCase({
    required ILoadLocalOccurrencesRepository loadLocalOccurrences,
  }) : _loadLocalOccurrences = loadLocalOccurrences;

  final ILoadLocalOccurrencesRepository _loadLocalOccurrences;

  Future<Either<Failure, List<OccurrenceEntity>>> call() async {
    final result = await _loadLocalOccurrences.loadOccurrences();
    return result.fold(left, right);
  }
}
