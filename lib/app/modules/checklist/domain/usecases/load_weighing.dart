import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/load_weighing_repository.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/weight_response_entity.dart';

class LoadWeighingUseCase {
  LoadWeighingUseCase({
    required ILoadWeighingRepository weighingRepository,
  }) : _weighingRepository = weighingRepository;
  final ILoadWeighingRepository _weighingRepository;

  Future<Either<Failure, WeightResponseEntity>> call({
    required String scheduleNumber,
    required String compartment,
    required String flowCode,
  }) async {
    final result = await _weighingRepository.loadWeighing(
      scheduleNumber: scheduleNumber,
      compartment: compartment,
      flowCode: flowCode,
    );
    return result.fold(left, right);
  }
}
