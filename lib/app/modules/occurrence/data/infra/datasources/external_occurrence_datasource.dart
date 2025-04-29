import 'package:portox_app/app/commons/domain/occurrence_entity.dart';

abstract class ICreateOccurrenceDataSource {
  Future<void> createOccurrence(OccurrenceEntity occurrence);
}
