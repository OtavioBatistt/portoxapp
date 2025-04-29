import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_type_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

class FilterCurrentOccurrenceTypesUseCase {
  Future<Either<Failure, List<OccurrenceTypeEntity>>> call({
    required List<OccurrenceTypeEntity> occurrenceTypes,
    required ScheduleEntity schedule,
    required String userProfile,
  }) async {
    final occurrenceTypeList = occurrenceTypes
        .where(
          (element) =>
              element.operationType == schedule.operationType[0] &&
              (element.profileCode == 'ALL' ||
                  element.profileCode == userProfile),
        )
        .toList();
    return right(occurrenceTypeList);
  }
}
