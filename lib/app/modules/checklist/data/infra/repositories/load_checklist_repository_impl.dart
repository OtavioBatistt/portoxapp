import 'package:dartz/dartz.dart';

import 'package:portox_app/app/commons/default_errors.dart';

import 'package:portox_app/app/modules/checklist/data/infra/datasources/checklist_storage_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/executed_step.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/load_checklist_repository.dart';

class LoadChecklistByScheduleNumberRepository
    implements ILoadChecklistByScheduleNumberRepository {
  LoadChecklistByScheduleNumberRepository({
    required ILoadChecklistDataSource loadChecklist,
  }) : _loadChecklist = loadChecklist;

  final ILoadChecklistDataSource _loadChecklist;

  @override
  Future<Either<Failure, List<ExecutedStepEntity>>>
      loadChecklistByScheduleNumber(
    String scheduleNumber,
  ) async {
    try {
      final list = <ExecutedStepEntity>[];
      final result = await _loadChecklist.loadChecklist(scheduleNumber);
      for (final checklist in result) {
        list.add(ExecutedStepEntity(
          compartment: checklist.compartment,
          flowCode: checklist.flowCode,
          scheduleNumber: checklist.scheduleNumber,
        ));
      }
      return right(list);
    } on Exception {
      return left(ClientError());
    }
  }
}
