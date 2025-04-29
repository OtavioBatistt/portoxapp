import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/storage_credentials_entity.dart';

abstract class ISaveCredentialsRepository {
  Future<Either<Failure, void>> saveCredentials(
    StorageCredentialsEntity params,
  );
}
