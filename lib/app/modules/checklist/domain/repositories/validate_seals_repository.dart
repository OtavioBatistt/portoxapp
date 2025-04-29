import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/seal_response_entity.dart';

abstract class IValidateSealsRepository {
  Future<Either<Failure, SealResponseEntity>> validateSeals({
    required String scheduleNumber,
    required String seal,
  });
}
