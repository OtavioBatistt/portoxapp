import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_entity.dart';

abstract class ISaveOccurrencesDataSource {
  Future<void> saveOccurrence(IsarOccurrenceEntity params);
}

abstract class ILoadLocalOccurrencesDataSource {
  Future<List<IsarOccurrenceEntity>> loadOccurrences();
}
