import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/checklist_storage_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/remove_checklist_repository.dart';

class RemoveChecklistRepository implements IRemoveChecklistRepository {
  RemoveChecklistRepository({
    required IRemoveChecklistDataSource removeChecklist,
  }) : _removeChecklist = removeChecklist;

  final IRemoveChecklistDataSource _removeChecklist;

  @override
  Future<Either<Failure, void>> removeChecklist({
    required String flowCode,
    required String scheduleNumber,
    int? compartment,
  }) async {
    try {
      final checklist = IsarChecklistEntity()
        ..flowCode = flowCode
        ..scheduleNumber = scheduleNumber
        ..compartment = compartment;

      await _removeChecklist.removeChecklist(checklist);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }
}
