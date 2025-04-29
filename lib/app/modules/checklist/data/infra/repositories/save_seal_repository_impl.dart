import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_seal_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/checklist_storage_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/save_seal_repository.dart';

class SaveSealRepository implements ISaveSealRepository {
  SaveSealRepository({
    required ISaveChecklistSealDataSource saveChecklistSeal,
  }) : _saveChecklistSeal = saveChecklistSeal;

  final ISaveChecklistSealDataSource _saveChecklistSeal;

  @override
  Future<Either<Failure, void>> saveSeal({
    required String sealCode,
    required String scheduleNumber,
  }) async {
    try {
      final checklistSeal = IsarChecklistSealEntity()
        ..sealCode = sealCode
        ..scheduleNumber = scheduleNumber;

      await _saveChecklistSeal.saveChecklistSeal(checklistSeal);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }
}
