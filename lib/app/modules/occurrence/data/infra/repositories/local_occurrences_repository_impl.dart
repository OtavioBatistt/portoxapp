import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/modules/occurrence/data/infra/datasources/local_occurrence_datasource.dart';
import 'package:portox_app/app/modules/occurrence/domain/repositories/local_storage_repository.dart';

class LocalOccurrencesRepository
    implements
        ISaveLocalOccurrencesRepository,
        ILoadLocalOccurrencesRepository {
  LocalOccurrencesRepository({
    required ISaveOccurrencesDataSource saveOccurrences,
    required ILoadLocalOccurrencesDataSource loadOccurrences,
  })  : _loadOccurrences = loadOccurrences,
        _saveOccurrences = saveOccurrences;

  final ISaveOccurrencesDataSource _saveOccurrences;
  final ILoadLocalOccurrencesDataSource _loadOccurrences;

  @override
  Future<Either<Failure, void>> saveOccurrence(
    OccurrenceEntity occurrence,
  ) async {
    try {
      final isarOccurrence = IsarOccurrenceEntity()
        ..type = occurrence.type
        ..token = occurrence.token
        ..lineId = occurrence.lineId
        ..comments = occurrence.comments
        ..createdAt = occurrence.createdAt
        ..rncNumber = occurrence.rncNumber
        ..scheduleNumber = occurrence.scheduleNumber;

      await _saveOccurrences.saveOccurrence(isarOccurrence);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }

  @override
  Future<Either<Failure, List<OccurrenceEntity>>> loadOccurrences() async {
    try {
      final occurrences = await _loadOccurrences.loadOccurrences();

      final list = <OccurrenceEntity>[];
      for (final occurrence in occurrences) {
        list.add(
          OccurrenceEntity(
            comments: occurrence.comments ?? '',
            createdAt: occurrence.createdAt ?? '',
            lineId: occurrence.lineId ?? 0,
            rncNumber: occurrence.rncNumber ?? '',
            scheduleNumber: occurrence.scheduleNumber ?? '',
            token: occurrence.token ?? '',
            type: occurrence.type ?? '',
          ),
        );
      }
      return right(list);
    } on Exception {
      return left(ClientError());
    }
  }
}
