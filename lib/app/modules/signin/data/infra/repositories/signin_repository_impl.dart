import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/data/infra/datasources/signin_datasource.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/signin_response_entity.dart';
import 'package:portox_app/app/modules/signin/domain/repositories/signin_repository.dart';

class SignInRepository implements ISignInRepository {
  SignInRepository({
    required ISignInDataSource dataSource,
  }) : _dataSource = dataSource;

  final ISignInDataSource _dataSource;

  @override
  Future<Either<Failure, SignInResponseEntity>> signIn(
    String email,
    String password,
  ) async {
    try {
      final response = await _dataSource.signIn(email, password);
      return right(response);
    } on Exception catch (e) {
      if (e is HttpDataSourceError && e.httpError?.statusCode == 500) {
        return left(NetworkError());
      } else if (e is HttpDataSourceError && e.httpError?.statusCode == 401) {
        return left(InvalidParams());
      }
      return left(ClientError());
    }
  }
}
