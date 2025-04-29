import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/signin_response_entity.dart';

abstract class ISignInRepository {
  Future<Either<Failure, SignInResponseEntity>> signIn(
    String email,
    String password,
  );
}
