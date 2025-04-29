import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_signature_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';
import 'package:portox_app/app/modules/schedule/data/infra/datasources/save_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/domain/repositories/local_storage_repository.dart';

class LocalSignaturesRepository
    implements
        IUpdateLocalSignaturesRepository,
        ILoadLocalSignaturesRepository {
  LocalSignaturesRepository({
    required ISaveSignaturesDataSource saveSignatures,
    required ILoadLocalSignaturesDataSource loadSignatures,
  })  : _loadSignatures = loadSignatures,
        _saveSignatures = saveSignatures;

  final ISaveSignaturesDataSource _saveSignatures;
  final ILoadLocalSignaturesDataSource _loadSignatures;

  @override
  Future<Either<Failure, void>> updateSignatures(
    List<SignatureEntity> signatures,
  ) async {
    try {
      final list = <IsarSignatureEntity>[];
      for (final signature in signatures) {
        list.add(
          IsarSignatureEntity()
            ..signatureId = signature.id
            ..docSignatureId = signature.docSignatureId
            ..sequence = signature.sequence
            ..responsiblePt = signature.responsiblePt
            ..responsibleUs = signature.responsibleUs
            ..responsibleEs = signature.responsibleEs
            ..required = signature.required
            ..flowCode = signature.flowCode
            ..operation = signature.operation
            ..loadType = signature.loadType,
        );
      }

      await _saveSignatures.saveSignatures(list);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }

  @override
  Future<Either<Failure, List<SignatureEntity>>> loadSignatures() async {
    try {
      final signatures = await _loadSignatures.loadSignatures();

      final list = <SignatureEntity>[];
      for (final signature in signatures) {
        list.add(
          SignatureEntity(
            id: signature.signatureId ?? 0,
            docSignatureId: signature.docSignatureId ?? 0,
            sequence: signature.sequence ?? 0,
            responsiblePt: signature.responsiblePt ?? '',
            responsibleUs: signature.responsibleUs ?? '',
            responsibleEs: signature.responsibleEs ?? '',
            required: signature.required ?? false,
            flowCode: signature.flowCode ?? '',
            operation: signature.operation ?? '',
            loadType: signature.loadType ?? '',
          ),
        );
      }
      return right(list);
    } on Exception {
      return left(ClientError());
    }
  }
}
