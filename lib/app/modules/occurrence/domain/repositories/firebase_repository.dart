import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';

abstract class ICreateOccurrenceRepository {
  Future<Either<Failure, void>> createOccurrence(OccurrenceEntity occurrence);
}
