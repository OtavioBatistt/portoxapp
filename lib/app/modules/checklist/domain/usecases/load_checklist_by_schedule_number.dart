import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/executed_step.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/load_checklist_repository.dart';

class LoadChecklistByScheduleNumberUseCase {
  LoadChecklistByScheduleNumberUseCase({
    required ILoadChecklistByScheduleNumberRepository checklistRepository,
  }) : _checklistRepository = checklistRepository;
  final ILoadChecklistByScheduleNumberRepository _checklistRepository;

  Future<Either<Failure, List<ExecutedStepEntity>>> call(
      String scheduleNumber) async {
    final result = await _checklistRepository
        .loadChecklistByScheduleNumber(scheduleNumber);
    return result.fold(left, right);
  }
}
