import 'dart:async';

abstract class IFirebaseSignInDataSource {
  Future<void> signIn(String email, String password);
}

abstract class IFirebaseSignOutDataSource {
  Future<void> signOut();
}

abstract class IFirebaseCreateDataSource {
  Future<void> create(String email, String password);
}
