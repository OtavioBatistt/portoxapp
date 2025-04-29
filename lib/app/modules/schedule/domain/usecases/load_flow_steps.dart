import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_flow_steps_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/external_repository.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LoadAndSaveFlowStepsUseCase {
  LoadAndSaveFlowStepsUseCase({
    required ILoadExternalFlowStepsRepository loadExternalFlowSteps,
    required ILoadLocalFlowStepsRepository loadLocalFlowSteps,
    required IUpdateLocalFlowStepsRepository updateLocalFlowSteps,
  })  : _loadLocalFlowSteps = loadLocalFlowSteps,
        _updateLocalFlowSteps = updateLocalFlowSteps,
        _loadExternalFlowSteps = loadExternalFlowSteps;

  final ILoadExternalFlowStepsRepository _loadExternalFlowSteps;
  final ILoadLocalFlowStepsRepository _loadLocalFlowSteps;
  final IUpdateLocalFlowStepsRepository _updateLocalFlowSteps;

  Future<Either<Failure, List<FlowStepEntity>>> call(
    String deviceSerial,
  ) async {
    final localResult = await _loadLocalFlowSteps.loadFlowSteps();
    final local = localResult.fold((e) => e, (r) => r);
    if (localResult.isLeft()) {
      return left(local as Failure);
    }

    final externalResult = await _loadExternalFlowSteps.loadFlowSteps(
      deviceSerial: deviceSerial,
      isInitialLoad: (local as List<FlowStepEntity>).isEmpty,
    );
    final external = externalResult.fold((e) => e, (r) => r);
    if (externalResult.isLeft()) {
      return left(external as Failure);
    }

    final flowStepList = local;
    for (final removeItem
        in (external as ExternalFlowStepsResponseEntity).removeList) {
      flowStepList.removeWhere((flowStep) => flowStep.id == removeItem);
    }
    for (final updateItem in external.updateList) {
      flowStepList
        ..removeWhere((flowStep) => flowStep.id == updateItem.id)
        ..add(updateItem);
    }
    if (external.removeList.isNotEmpty || external.updateList.isNotEmpty) {
      await _updateLocalFlowSteps.updateFlowSteps(flowStepList);
    }
    return right(flowStepList);
  }
}
