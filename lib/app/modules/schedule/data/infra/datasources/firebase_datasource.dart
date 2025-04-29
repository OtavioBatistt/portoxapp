import 'dart:async';

import 'package:portox_app/app/commons/domain/schedule_entity.dart';

abstract class ILoadSchedulesDataSource {
  StreamSubscription loadSchedules(
    Function(List<ScheduleEntity>) onListenChange, {
    int? limit,
    List<String>? plantCodes,
  });
}
