import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/firebase_datasource.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/firebase_repository.dart';

class FirebaseRepository implements ILoadSchedulesRepository {
  FirebaseRepository({
    required ILoadSchedulesDataSource schedulesDataSource,
  }) : _schedulesDataSource = schedulesDataSource;

  final ILoadSchedulesDataSource _schedulesDataSource;

  @override
  Future<Either<Failure, StreamSubscription>> loadSchedules(
    Function(List<ScheduleEntity>) onListenChange, {
    int? limit,
    List<String>? plantCodes,
  }) async {
    try {
      final response = _schedulesDataSource.loadSchedules(
        onListenChange,
        limit: limit,
        plantCodes: plantCodes,
      );
      return right(response);
    } on Exception {
      return left(ClientError());
    }
  }
}
