import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/occurrence_type_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_occurrence_types_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/external_repository.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LoadAndSaveOccurrenceTypesUseCase {
  LoadAndSaveOccurrenceTypesUseCase({
    required ILoadExternalOccurrenceTypesRepository loadExternalOccurrenceTypes,
    required ILoadLocalOccurrenceTypesRepository loadLocalOccurrenceTypes,
    required IUpdateLocalOccurrenceTypesRepository updateLocalOccurrenceTypes,
  })  : _loadLocalOccurrenceTypes = loadLocalOccurrenceTypes,
        _updateLocalOccurrenceTypes = updateLocalOccurrenceTypes,
        _loadExternalOccurrenceTypes = loadExternalOccurrenceTypes;

  final ILoadExternalOccurrenceTypesRepository _loadExternalOccurrenceTypes;
  final ILoadLocalOccurrenceTypesRepository _loadLocalOccurrenceTypes;
  final IUpdateLocalOccurrenceTypesRepository _updateLocalOccurrenceTypes;

  Future<Either<Failure, List<OccurrenceTypeEntity>>> call(
    String deviceSerial,
  ) async {
    final localResult = await _loadLocalOccurrenceTypes.loadOccurrenceTypes();
    final local = localResult.fold((e) => e, (r) => r);
    if (localResult.isLeft()) {
      return left(local as Failure);
    }

    final externalResult =
        await _loadExternalOccurrenceTypes.loadOccurrenceTypes(
      deviceSerial: deviceSerial,
      isInitialLoad: (local as List<OccurrenceTypeEntity>).isEmpty,
    );
    final external = externalResult.fold((e) => e, (r) => r);
    if (externalResult.isLeft()) {
      return left(external as Failure);
    }

    final occurrenceList = local;
    for (final removeItem
        in (external as ExternalOccurrenceTypesResponseEntity).removeList) {
      occurrenceList.removeWhere((occurrence) => occurrence.id == removeItem);
    }
    for (final updateItem in external.updateList) {
      occurrenceList
        ..removeWhere((occurrence) => occurrence.id == updateItem.id)
        ..add(updateItem);
    }
    if (external.removeList.isNotEmpty || external.updateList.isNotEmpty) {
      await _updateLocalOccurrenceTypes.updateOccurrenceTypes(occurrenceList);
    }
    return right(occurrenceList);
  }
}
