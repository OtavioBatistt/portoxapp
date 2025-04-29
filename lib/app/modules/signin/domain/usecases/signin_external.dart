import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/domain/repositories/firebase_auth_repository.dart';

class SignInExternal {
  SignInExternal({
    required IFirebaseSignInRepository signInRepository,
    required IFirebaseCreateRepository createRepository,
  })  : _signInRepository = signInRepository,
        _createRepository = createRepository;

  final IFirebaseSignInRepository _signInRepository;
  final IFirebaseCreateRepository _createRepository;

  Future<Either<Failure, void>> call(
    String email,
    String password,
  ) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final result = await _signInRepository.signIn(email, password);
      return result.fold(
        (e) async {
          final createResult = await _createRepository.create(email, password);
          return createResult.fold(
            (e) => left(e),
            (r) => right(r),
          );
        },
        (r) => right(r),
      );
    } else {
      return left(InvalidParams());
    }
  }
}
