import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_flow_steps_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/save_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LocalFlowStepsRepository
    implements IUpdateLocalFlowStepsRepository, ILoadLocalFlowStepsRepository {
  LocalFlowStepsRepository({
    required ISaveFlowStepsDataSource saveFlowSteps,
    required ILoadLocalFlowStepsDataSource loadFlowSteps,
  })  : _loadFlowSteps = loadFlowSteps,
        _saveFlowSteps = saveFlowSteps;

  final ISaveFlowStepsDataSource _saveFlowSteps;
  final ILoadLocalFlowStepsDataSource _loadFlowSteps;

  @override
  Future<Either<Failure, void>> updateFlowSteps(
    List<FlowStepEntity> flowSteps,
  ) async {
    try {
      final list = <IsarFlowStepsEntity>[];
      for (final flowStep in flowSteps) {
        list.add(
          IsarFlowStepsEntity()
            ..flowStepId = flowStep.id
            ..plantCode = flowStep.plantCode
            ..plantDescription = flowStep.plantDescription
            ..profileCode = flowStep.profileCode
            ..profileName = flowStep.profileName
            ..operationType = flowStep.operationType
            ..locationGroup = flowStep.locationGroup
            ..windowType = flowStep.windowType
            ..sequence = flowStep.sequence
            ..flowCode = flowStep.flowCode
            ..flowDescription = flowStep.flowDescription
            ..compartmented = flowStep.compartmented
            ..signatures = flowStep.signatures
            ..questions = flowStep.questions
            ..skippable = flowStep.skippable,
        );
      }

      await _saveFlowSteps.saveFlowSteps(list);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }

  @override
  Future<Either<Failure, List<FlowStepEntity>>> loadFlowSteps() async {
    try {
      final flowSteps = await _loadFlowSteps.loadFlowSteps();

      final list = <FlowStepEntity>[];
      for (final flowStep in flowSteps) {
        list.add(FlowStepEntity(
          id: flowStep.flowStepId ?? '',
          plantCode: flowStep.plantCode ?? '',
          plantDescription: flowStep.plantDescription ?? '',
          profileCode: flowStep.profileCode ?? '',
          profileName: flowStep.profileName ?? '',
          operationType: flowStep.operationType ?? '',
          locationGroup: flowStep.locationGroup ?? '',
          windowType: flowStep.windowType ?? '',
          sequence: flowStep.sequence ?? 0,
          flowCode: flowStep.flowCode ?? '',
          flowDescription: flowStep.flowDescription ?? '',
          compartmented: flowStep.compartmented ?? false,
          signatures: flowStep.signatures ?? false,
          questions: flowStep.questions ?? false,
          skippable: flowStep.skippable ?? false,
        ));
      }
      return right(list);
    } on Exception {
      return left(ClientError());
    }
  }
}
