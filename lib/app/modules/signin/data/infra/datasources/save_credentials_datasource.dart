import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_credentials_entity.dart';

abstract class ISaveCredentialsDataSource {
  Future<void> saveCredentials(IsarCredentialsEntity params);
}
