import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';

abstract class ISaveLocalOccurrencesRepository {
  Future<Either<Failure, void>> saveOccurrence(
    OccurrenceEntity params,
  );
}

abstract class ILoadLocalOccurrencesRepository {
  Future<Either<Failure, List<OccurrenceEntity>>> loadOccurrences();
}
