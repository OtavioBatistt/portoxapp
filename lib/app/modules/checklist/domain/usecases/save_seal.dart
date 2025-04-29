import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/save_seal_repository.dart';

class SaveSealUseCase {
  SaveSealUseCase({
    required ISaveSealRepository sealRepository,
  }) : _sealRepository = sealRepository;
  final ISaveSealRepository _sealRepository;

  Future<Either<Failure, void>> call({
    required String sealCode,
    required String scheduleNumber,
  }) async {
    final result = await _sealRepository.saveSeal(
      sealCode: sealCode,
      scheduleNumber: scheduleNumber,
    );
    return result.fold(left, right);
  }
}
