import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/data/infra/datasources/firebase_auth_datasource.dart';
import 'package:portox_app/app/modules/signin/domain/repositories/firebase_auth_repository.dart';

class FirebaseAuthRepository
    implements
        IFirebaseSignInRepository,
        IFirebaseCreateRepository,
        IFirebaseSignOutRepository {
  FirebaseAuthRepository({
    required IFirebaseSignInDataSource signInDataSource,
    required IFirebaseSignOutDataSource signOutDataSource,
    required IFirebaseCreateDataSource createDataSource,
  })  : _signInDataSource = signInDataSource,
        _signOutDataSource = signOutDataSource,
        _createDataSource = createDataSource;

  final IFirebaseSignInDataSource _signInDataSource;
  final IFirebaseSignOutDataSource _signOutDataSource;
  final IFirebaseCreateDataSource _createDataSource;

  @override
  Future<Either<Failure, void>> signIn(String email, String password) async {
    try {
      await _signInDataSource.signIn(email, password);
      return right(null);
    } on Exception {
      return left(ClientError());
    }
  }

  @override
  Future<Either<Failure, void>> create(String email, String password) async {
    try {
      await _createDataSource.create(email, password);
      return right(null);
    } on Exception {
      return left(ClientError());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _signOutDataSource.signOut();
      return right(null);
    } on Exception {
      return left(ClientError());
    }
  }
}
