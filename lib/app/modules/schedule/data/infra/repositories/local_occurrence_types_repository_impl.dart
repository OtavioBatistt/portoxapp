import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_type_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_type_entity.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/save_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LocalOccurrenceTypesRepository
    implements
        IUpdateLocalOccurrenceTypesRepository,
        ILoadLocalOccurrenceTypesRepository {
  LocalOccurrenceTypesRepository({
    required ISaveOccurrenceTypesDataSource saveOccurrenceTypes,
    required ILoadLocalOccurrenceTypesDataSource loadOccurrenceTypes,
  })  : _loadOccurrenceTypes = loadOccurrenceTypes,
        _saveOccurrenceTypes = saveOccurrenceTypes;

  final ISaveOccurrenceTypesDataSource _saveOccurrenceTypes;
  final ILoadLocalOccurrenceTypesDataSource _loadOccurrenceTypes;

  @override
  Future<Either<Failure, void>> updateOccurrenceTypes(
    List<OccurrenceTypeEntity> occurrenceTypes,
  ) async {
    try {
      final list = <IsarOccurrenceTypeEntity>[];
      for (final occurrence in occurrenceTypes) {
        list.add(
          IsarOccurrenceTypeEntity()
            ..occurrenceId = occurrence.id
            ..required = occurrence.required
            ..classificCodePt = occurrence.classificCodePt
            ..classificCodeUs = occurrence.classificCodeUs
            ..classificCodeEs = occurrence.classificCodeEs
            ..classificId = occurrence.classificId
            ..operationType = occurrence.operationType
            ..profileCode = occurrence.profileCode
            ..profileName = occurrence.profileName,
        );
      }

      await _saveOccurrenceTypes.saveOccurrenceTypes(list);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }

  @override
  Future<Either<Failure, List<OccurrenceTypeEntity>>>
      loadOccurrenceTypes() async {
    try {
      final occurrenceTypes = await _loadOccurrenceTypes.loadOccurrenceTypes();

      final list = <OccurrenceTypeEntity>[];
      for (final occurrence in occurrenceTypes) {
        list.add(OccurrenceTypeEntity(
          id: occurrence.occurrenceId ?? '',
          required: occurrence.required ?? false,
          classificCodePt: occurrence.classificCodePt ?? '',
          classificCodeUs: occurrence.classificCodeUs ?? '',
          classificCodeEs: occurrence.classificCodeEs ?? '',
          classificId: occurrence.classificId ?? 0,
          operationType: occurrence.operationType ?? '',
          profileCode: occurrence.profileCode ?? '',
          profileName: occurrence.profileName ?? '',
        ));
      }
      return right(list);
    } on Exception {
      return left(ClientError());
    }
  }
}
