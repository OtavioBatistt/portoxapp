import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_seal_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/storage_user_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/checklist_storage_datasource.dart';

class StorageChecklistDataSource
    implements
        ISaveChecklistDataSource,
        IRemoveChecklistDataSource,
        ILoadChecklistDataSource,
        ISaveChecklistSealDataSource,
        ILoadChecklistSealDataSource {
  StorageChecklistDataSource({
    required ILocalStorageAdapter storage,
  }) : _storage = storage;

  final ILocalStorageAdapter _storage;

  @override
  Future<void> saveChecklist(IsarChecklistEntity checklist) async {
    try {
      await _storage.saveChecklist(checklist);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<List<IsarChecklistEntity>> loadChecklist(String scheduleNumber) async {
    try {
      return await _storage.loadChecklists(scheduleNumber);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<void> removeChecklist(IsarChecklistEntity checklist) async {
    try {
      await _storage.removeChecklist(checklist);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<void> saveChecklistSeal(IsarChecklistSealEntity params) async {
    try {
      await _storage.saveChecklistSeal(params);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<bool> loadChecklistSeal(String sealCode) async {
    try {
      return await _storage.loadChecklistSeal(sealCode);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<List<String>> loadSealCodesByScheduleNumber(
    String scheduleNumber,
  ) async {
    try {
      return await _storage.loadSealCodesByScheduleNumber(scheduleNumber);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }
}
