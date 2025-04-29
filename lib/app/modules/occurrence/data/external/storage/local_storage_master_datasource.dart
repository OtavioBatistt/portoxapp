import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/storage_user_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/occurrence/data/infra/datasources/local_occurrence_datasource.dart';

class LocalStorageOccurrenceDataSource
    implements ISaveOccurrencesDataSource, ILoadLocalOccurrencesDataSource {
  LocalStorageOccurrenceDataSource({
    required ILocalStorageAdapter storage,
  }) : _storage = storage;

  final ILocalStorageAdapter _storage;

  @override
  Future<void> saveOccurrence(IsarOccurrenceEntity occurrence) async {
    try {
      await _storage.saveOccurrence(occurrence);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<List<IsarOccurrenceEntity>> loadOccurrences() async {
    try {
      return await _storage.loadOccurrences();
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }
}
