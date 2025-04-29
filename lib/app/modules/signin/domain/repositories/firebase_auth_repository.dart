import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';

abstract class IFirebaseSignInRepository {
  Future<Either<Failure, void>> signIn(String email, String password);
}

abstract class IFirebaseCreateRepository {
  Future<Either<Failure, void>> create(String email, String password);
}

abstract class IFirebaseSignOutRepository {
  Future<Either<Failure, void>> signOut();
}
