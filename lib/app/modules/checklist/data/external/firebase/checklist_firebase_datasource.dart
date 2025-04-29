import 'dart:async';

import 'package:portox_app/app/commons/adapters/storage/external_storage_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/checklist_entity.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/checklist_firebase_datasource.dart';

class ChecklistFirebaseDataSource implements ICreateChecklistDataSource {
  ChecklistFirebaseDataSource(
      {required IExternalStorageAdapter externalStorage})
      : _externalStorage = externalStorage;

  final IExternalStorageAdapter _externalStorage;

  @override
  Future<void> createChecklist(ChecklistEntity checklist) async {
    try {
      await _externalStorage.createChecklist(checklist);
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }
}
