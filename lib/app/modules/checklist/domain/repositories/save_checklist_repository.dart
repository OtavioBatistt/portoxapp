import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';

abstract class ISaveChecklistRepository {
  Future<Either<Failure, void>> saveChecklist({
    required String flowCode,
    required String scheduleNumber,
    int? compartment,
  });
}
