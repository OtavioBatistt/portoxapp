import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/data/infra/datasources/firebase_auth_datasource.dart';

class FirebaseAuthDataSource
    implements
        IFirebaseSignInDataSource,
        IFirebaseSignOutDataSource,
        IFirebaseCreateDataSource {
  FirebaseAuthDataSource({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.currentUser?.delete();
      await _firebaseAuth.signOut();
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<void> create(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }
}
