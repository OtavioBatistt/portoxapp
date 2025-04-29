import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/seal_response_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/validate_seals_repository.dart';

class ValidateSealUseCase {
  ValidateSealUseCase({
    required IValidateSealsRepository sealRepository,
  }) : _sealRepository = sealRepository;
  final IValidateSealsRepository _sealRepository;

  Future<Either<Failure, SealResponseEntity>> call({
    required String scheduleNumber,
    required String seal,
  }) async {
    final result = await _sealRepository.validateSeals(
      scheduleNumber: scheduleNumber,
      seal: seal,
    );
    return result.fold(left, right);
  }
}
