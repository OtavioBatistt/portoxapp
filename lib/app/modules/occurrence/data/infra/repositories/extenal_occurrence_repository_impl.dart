import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/modules/occurrence/data/infra/datasources/external_occurrence_datasource.dart';
import 'package:portox_app/app/modules/occurrence/domain/repositories/firebase_repository.dart';

class ExternalOccurrenceRepository implements ICreateOccurrenceRepository {
  ExternalOccurrenceRepository({
    required ICreateOccurrenceDataSource occurrenceDataSource,
  }) : _occurrenceDataSource = occurrenceDataSource;

  final ICreateOccurrenceDataSource _occurrenceDataSource;

  @override
  Future<Either<Failure, void>> createOccurrence(
    OccurrenceEntity occurrence,
  ) async {
    try {
      await _occurrenceDataSource.createOccurrence(occurrence);
      return right(null);
    } on Exception {
      return left(ClientError());
    }
  }
}
