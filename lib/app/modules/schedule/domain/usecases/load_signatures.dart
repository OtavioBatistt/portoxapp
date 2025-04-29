import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/external_signatures_response_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/external_repository.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LoadAndSaveSignaturesUseCase {
  LoadAndSaveSignaturesUseCase({
    required ILoadExternalSignaturesRepository loadExternalSignatures,
    required ILoadLocalSignaturesRepository loadLocalSignatures,
    required IUpdateLocalSignaturesRepository updateLocalSignatures,
  })  : _loadLocalSignatures = loadLocalSignatures,
        _updateLocalSignatures = updateLocalSignatures,
        _loadExternalSignatures = loadExternalSignatures;

  final ILoadExternalSignaturesRepository _loadExternalSignatures;
  final ILoadLocalSignaturesRepository _loadLocalSignatures;
  final IUpdateLocalSignaturesRepository _updateLocalSignatures;

  Future<Either<Failure, List<SignatureEntity>>> call(
    String deviceSerial,
  ) async {
    final localResult = await _loadLocalSignatures.loadSignatures();
    final local = localResult.fold((e) => e, (r) => r);
    if (localResult.isLeft()) {
      return left(local as Failure);
    }

    final externalResult = await _loadExternalSignatures.loadSignatures(
      deviceSerial: deviceSerial,
      isInitialLoad: (local as List<SignatureEntity>).isEmpty,
    );
    final external = externalResult.fold((e) => e, (r) => r);
    if (externalResult.isLeft()) {
      return left(external as Failure);
    }

    final signatureList = local;
    for (final removeItem
        in (external as ExternalSignaturesResponseEntity).removeList) {
      signatureList.removeWhere((signature) => signature.id == removeItem);
    }
    for (final updateItem in external.updateList) {
      signatureList
        ..removeWhere((signature) => signature.id == updateItem.id)
        ..add(updateItem);
    }
    if (external.removeList.isNotEmpty || external.updateList.isNotEmpty) {
      await _updateLocalSignatures.updateSignatures(signatureList);
    }
    return right(signatureList);
  }
}
