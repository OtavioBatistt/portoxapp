import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';

class FilterCurrentSignaturesUseCase {
  Either<Failure, List<SignatureEntity>> call({
    required List<SignatureEntity> signatures,
    required FlowStepEntity flowStep,
    required ScheduleEntity schedule,
  }) {
    final signatureList = signatures
        .where(
          (signature) =>
              signature.flowCode == flowStep.flowCode &&
              (signature.operation == 'B' ||
                  signature.operation == schedule.operation) &&
              (signature.loadType == 'B' ||
                  signature.loadType == schedule.loadType),
        )
        .toList()
      ..sort((a, b) => a.sequence.compareTo(b.sequence));
    return right(signatureList);
  }
}
