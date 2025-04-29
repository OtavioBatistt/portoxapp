import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/checklist_entity.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/checklist_firebase_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/checklist_firebase_repository.dart';

class ChecklistFirebaseRepository implements ICreateChecklistRepository {
  ChecklistFirebaseRepository({
    required ICreateChecklistDataSource checklistDataSource,
  }) : _checklistDataSource = checklistDataSource;

  final ICreateChecklistDataSource _checklistDataSource;

  @override
  Future<Either<Failure, void>> createChecklist(
    ChecklistEntity checklist,
  ) async {
    try {
      await _checklistDataSource.createChecklist(checklist);
      return right(null);
    } on Exception {
      return left(ClientError());
    }
  }
}
