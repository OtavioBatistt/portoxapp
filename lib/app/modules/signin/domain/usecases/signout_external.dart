import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/domain/repositories/firebase_auth_repository.dart';

class SignOutExternal {
  SignOutExternal({
    required IFirebaseSignOutRepository signOutRepository,
  }) : _signOutRepository = signOutRepository;

  final IFirebaseSignOutRepository _signOutRepository;

  Future<Either<Failure, void>> call() async {
    final result = await _signOutRepository.signOut();
    return result.fold(
      (e) => left(e),
      (r) => right(r),
    );
  }
}
