import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';

abstract class ILoadSealRepository {
  Future<Either<Failure, bool>> loadSeal(
    String sealCode,
  );

  Future<Either<Failure, List<String>>> loadSealCodesByScheduleNumber(
    String scheduleNumber,
  );
}
