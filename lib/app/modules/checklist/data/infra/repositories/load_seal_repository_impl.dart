import 'package:dartz/dartz.dart';

import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/checklist_storage_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/load_seal_repository.dart';

class LoadSealRepository implements ILoadSealRepository {
  LoadSealRepository({
    required ILoadChecklistSealDataSource loadChecklistSeal,
  }) : _loadChecklistSeal = loadChecklistSeal;

  final ILoadChecklistSealDataSource _loadChecklistSeal;

  @override
  Future<Either<Failure, bool>> loadSeal(
    String sealCode,
  ) async {
    try {
      final result = await _loadChecklistSeal.loadChecklistSeal(sealCode);
      return right(result);
    } on Exception {
      return left(ClientError());
    }
  }

  @override
  Future<Either<Failure, List<String>>> loadSealCodesByScheduleNumber(
      String scheduleNumber) async {
    try {
      final result = await _loadChecklistSeal
          .loadSealCodesByScheduleNumber(scheduleNumber);
      return right(result);
    } on Exception {
      return left(ClientError());
    }
  }
}
