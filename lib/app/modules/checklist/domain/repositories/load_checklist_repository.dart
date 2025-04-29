import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/executed_step.dart';

abstract class ILoadChecklistByScheduleNumberRepository {
  Future<Either<Failure, List<ExecutedStepEntity>>>
      loadChecklistByScheduleNumber(
    String scheduleNumber,
  );
}
