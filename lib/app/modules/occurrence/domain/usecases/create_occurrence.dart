import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/modules/occurrence/domain/repositories/firebase_repository.dart';

class CreateOccurrenceUseCase {
  CreateOccurrenceUseCase({
    required ICreateOccurrenceRepository occurrenceRepository,
  }) : _occurrenceRepository = occurrenceRepository;
  final ICreateOccurrenceRepository _occurrenceRepository;

  Future<Either<Failure, void>> call(OccurrenceEntity occurrence) async {
    final result = await _occurrenceRepository.createOccurrence(occurrence);
    return result.fold(left, right);
  }
}
