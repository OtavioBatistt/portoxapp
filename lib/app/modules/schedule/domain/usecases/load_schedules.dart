import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/firebase_repository.dart';

class LoadSchedulesUseCase {
  LoadSchedulesUseCase({
    required ILoadSchedulesRepository schedulesRepository,
  }) : _schedulesRepository = schedulesRepository;

  final ILoadSchedulesRepository _schedulesRepository;

  Future<Either<Failure, StreamSubscription>> call(
    Function(List<ScheduleEntity>) onListenChange, {
    int? limit,
    List<String>? plantCodes,
  }) async {
    final result = await _schedulesRepository.loadSchedules(
      onListenChange,
      limit: limit,
      plantCodes: plantCodes,
    );
    return result.fold(left, right);
  }
}
