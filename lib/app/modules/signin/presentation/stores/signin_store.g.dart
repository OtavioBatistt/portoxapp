// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on SignInStoreBase, Store {
  late final _$statusAtom =
      Atom(name: 'SignInStoreBase.status', context: context);

  @override
  ValueNotifier<SignInStatus> get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ValueNotifier<SignInStatus> value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: 'SignInStoreBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SignInStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('SignInStoreBase.onSubmit', context: context);

  @override
  Future<dynamic> onSubmit(BuildContext context) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(context));
  }

  late final _$SignInStoreBaseActionController =
      ActionController(name: 'SignInStoreBase', context: context);

  @override
  void setStatus(SignInStatus value) {
    final _$actionInfo = _$SignInStoreBaseActionController.startAction(
        name: 'SignInStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$SignInStoreBaseActionController.startAction(
        name: 'SignInStoreBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$SignInStoreBaseActionController.startAction(
        name: 'SignInStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
username: ${username},
password: ${password}
    ''';
  }
}
