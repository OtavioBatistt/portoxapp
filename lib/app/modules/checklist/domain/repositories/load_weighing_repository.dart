import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/weight_response_entity.dart';

abstract class ILoadWeighingRepository {
  Future<Either<Failure, WeightResponseEntity>> loadWeighing({
    required String scheduleNumber,
    required String compartment,
    required String flowCode,
  });
}
