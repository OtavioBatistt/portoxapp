import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/checklist_storage_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/save_checklist_repository.dart';

class SaveChecklistRepository implements ISaveChecklistRepository {
  SaveChecklistRepository({
    required ISaveChecklistDataSource saveChecklist,
  }) : _saveChecklist = saveChecklist;

  final ISaveChecklistDataSource _saveChecklist;

  @override
  Future<Either<Failure, void>> saveChecklist({
    required String flowCode,
    required String scheduleNumber,
    int? compartment,
  }) async {
    //TODO
    try {
      final checklist = IsarChecklistEntity()
        ..flowCode = flowCode
        ..scheduleNumber = scheduleNumber
        ..compartment = compartment;

      await _saveChecklist.saveChecklist(checklist);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }
}
