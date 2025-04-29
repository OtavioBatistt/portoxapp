import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_credentials_entity.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/data/infra/datasources/save_credentials_datasource.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/storage_credentials_entity.dart';
import 'package:portox_app/app/modules/signin/domain/repositories/save_credentials_repository.dart';

class SaveCredentialsRepository implements ISaveCredentialsRepository {
  SaveCredentialsRepository({
    required ISaveCredentialsDataSource dataSource,
  }) : _dataSource = dataSource;

  final ISaveCredentialsDataSource _dataSource;

  @override
  Future<Either<Failure, void>> saveCredentials(
    StorageCredentialsEntity params,
  ) async {
    try {
      final user = IsarCredentialsEntity()
        ..expirationDate = params.expirationDate
        ..token = params.token;

      await _dataSource.saveCredentials(user);
    } on Exception {
      return left(ClientError());
    }
    return right(null);
  }
}
