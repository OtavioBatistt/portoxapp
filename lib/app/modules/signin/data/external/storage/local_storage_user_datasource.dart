import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_credentials_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/storage_user_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/data/infra/datasources/save_credentials_datasource.dart';

class LocalStorageUserDataSource implements ISaveCredentialsDataSource {
  LocalStorageUserDataSource({
    required ILocalStorageAdapter storage,
  }) : _storage = storage;

  final ILocalStorageAdapter _storage;

  @override
  Future<void> saveCredentials(IsarCredentialsEntity params) async {
    try {
      await _storage.saveCredentials(params);
    } on Exception {
      throw CommonDataSourceError(message: 'Unexpected error');
    }
  }
}
