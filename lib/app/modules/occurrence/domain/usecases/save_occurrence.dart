import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/modules/occurrence/domain/repositories/local_storage_repository.dart';

class SaveOccurrenceUseCase {
  SaveOccurrenceUseCase({
    required ISaveLocalOccurrencesRepository occurrenceRepository,
  }) : _occurrenceRepository = occurrenceRepository;
  final ISaveLocalOccurrencesRepository _occurrenceRepository;

  Future<Either<Failure, void>> call(OccurrenceEntity occurrence) async {
    final result = await _occurrenceRepository.saveOccurrence(occurrence);
    return result.fold(left, right);
  }
}
