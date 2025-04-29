import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

class FilterCurrentStepsUseCase {
  Future<Either<Failure, List<FlowStepEntity>>> call({
    required List<FlowStepEntity> flowSteps,
    required ScheduleEntity schedule,
    required String userProfile,
  }) async {
    final stepList = flowSteps
        .where(
          (element) =>
              element.plantCode == schedule.plantCode &&
              element.operationType == schedule.operationType &&
              element.windowType == schedule.windowType &&
              element.locationGroup == schedule.locationGroup &&
              element.profileCode == userProfile,
        )
        .toList()
      ..sort((a, b) => a.sequence.compareTo(b.sequence));
    return right(stepList);
  }
}
