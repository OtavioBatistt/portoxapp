import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/api_weighing_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/load_weighing_repository.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/weight_response_entity.dart';

class ApiWeighingRepository implements ILoadWeighingRepository {
  ApiWeighingRepository({
    required ILoadWeighingDataSource weighingDataSource,
  }) : _weighingDataSource = weighingDataSource;

  final ILoadWeighingDataSource _weighingDataSource;

  @override
  Future<Either<Failure, WeightResponseEntity>> loadWeighing({
    required String scheduleNumber,
    required String compartment,
    required String flowCode,
  }) async {
    try {
      final response = await _weighingDataSource.loadWeighing(
        scheduleNumber: scheduleNumber,
        compartment: compartment,
        flowCode: flowCode,
      );
      return right(response);
    } on Exception {
      return left(ClientError());
    }
  }
}
