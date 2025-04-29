import 'dart:async';

import 'package:portox_app/app/commons/adapters/storage/external_storage_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/firebase_datasource.dart';

class FirebaseDataSource implements ILoadSchedulesDataSource {
  FirebaseDataSource({required IExternalStorageAdapter externalStorage})
      : _externalStorage = externalStorage;

  final IExternalStorageAdapter _externalStorage;
  @override
  StreamSubscription loadSchedules(
    Function(List<ScheduleEntity>) onListenChange, {
    int? limit,
    List<String>? plantCodes,
  }) =>
      _externalStorage.loadSchedules(
        (schedules) {
          try {
            onListenChange(schedules);
          } on HttpClientError catch (e) {
            throw HttpDataSourceError(httpError: e, message: e.message);
          } on Exception {
            throw HttpDataSourceError(message: 'Unexpected error');
          }
        },
        limit: limit,
        plantCodes: plantCodes,
      );
}
