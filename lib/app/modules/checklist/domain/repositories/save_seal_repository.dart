import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';

abstract class ISaveSealRepository {
  Future<Either<Failure, void>> saveSeal({
    required String sealCode,
    required String scheduleNumber,
  });
}
