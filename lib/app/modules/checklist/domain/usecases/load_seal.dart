import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/load_seal_repository.dart';

class LoadSealUseCase {
  LoadSealUseCase({
    required ILoadSealRepository loadSealRepository,
  }) : _loadSealRepository = loadSealRepository;
  final ILoadSealRepository _loadSealRepository;

  Future<Either<Failure, bool>> call(String sealCode) async {
    final result = await _loadSealRepository.loadSeal(sealCode);
    return result.fold(left, right);
  }
}
