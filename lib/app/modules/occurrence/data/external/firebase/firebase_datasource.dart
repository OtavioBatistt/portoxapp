import 'dart:async';

import 'package:portox_app/app/commons/adapters/storage/external_storage_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/modules/occurrence/data/infra/datasources/external_occurrence_datasource.dart';

class FirebaseOccurrenceDataSource implements ICreateOccurrenceDataSource {
  FirebaseOccurrenceDataSource({
    required IExternalStorageAdapter externalStorage,
  }) : _externalStorage = externalStorage;

  final IExternalStorageAdapter _externalStorage;
  @override
  Future<void> createOccurrence(OccurrenceEntity occurrence) async {
    try {
      await _externalStorage.createOccurrence(occurrence);
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }
}
