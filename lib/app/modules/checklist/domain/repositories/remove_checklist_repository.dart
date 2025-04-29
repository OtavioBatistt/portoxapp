import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';

abstract class IRemoveChecklistRepository {
  Future<Either<Failure, void>> removeChecklist({
    required String flowCode,
    required String scheduleNumber,
    int? compartment,
  });
}
