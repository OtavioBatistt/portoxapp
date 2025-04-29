import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/api_seal_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/seal_response_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/validate_seals_repository.dart';

class ApiSealsRepository implements IValidateSealsRepository {
  ApiSealsRepository({
    required IValidateSealsDataSource sealsDataSource,
  }) : _sealsDataSource = sealsDataSource;

  final IValidateSealsDataSource _sealsDataSource;

  @override
  Future<Either<Failure, SealResponseEntity>> validateSeals({
    required String scheduleNumber,
    required String seal,
  }) async {
    try {
      final response = await _sealsDataSource.validateSeals(
        scheduleNumber: scheduleNumber,
        seal: seal,
      );
      return right(response);
    } on Exception {
      return left(ClientError());
    }
  }
}
