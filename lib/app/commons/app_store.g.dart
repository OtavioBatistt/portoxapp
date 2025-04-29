// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppStoreBase, Store {
  late final _$isLoggedAtom =
      Atom(name: 'AppStoreBase.isLogged', context: context);

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  late final _$tokenAtom = Atom(name: 'AppStoreBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$expirationDateAtom =
      Atom(name: 'AppStoreBase.expirationDate', context: context);

  @override
  String get expirationDate {
    _$expirationDateAtom.reportRead();
    return super.expirationDate;
  }

  @override
  set expirationDate(String value) {
    _$expirationDateAtom.reportWrite(value, super.expirationDate, () {
      super.expirationDate = value;
    });
  }

  late final _$nameAtom = Atom(name: 'AppStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: 'AppStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$profileAtom =
      Atom(name: 'AppStoreBase.profile', context: context);

  @override
  String get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(String value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  late final _$profileNameAtom =
      Atom(name: 'AppStoreBase.profileName', context: context);

  @override
  String get profileName {
    _$profileNameAtom.reportRead();
    return super.profileName;
  }

  @override
  set profileName(String value) {
    _$profileNameAtom.reportWrite(value, super.profileName, () {
      super.profileName = value;
    });
  }

  late final _$plantsAtom = Atom(name: 'AppStoreBase.plants', context: context);

  @override
  List<PlantEntity> get plants {
    _$plantsAtom.reportRead();
    return super.plants;
  }

  @override
  set plants(List<PlantEntity> value) {
    _$plantsAtom.reportWrite(value, super.plants, () {
      super.plants = value;
    });
  }

  late final _$supervisorsAtom =
      Atom(name: 'AppStoreBase.supervisors', context: context);

  @override
  List<SupervisorEntity> get supervisors {
    _$supervisorsAtom.reportRead();
    return super.supervisors;
  }

  @override
  set supervisors(List<SupervisorEntity> value) {
    _$supervisorsAtom.reportWrite(value, super.supervisors, () {
      super.supervisors = value;
    });
  }

  late final _$errorFlushbarAtom =
      Atom(name: 'AppStoreBase.errorFlushbar', context: context);

  @override
  Flushbar<dynamic>? get errorFlushbar {
    _$errorFlushbarAtom.reportRead();
    return super.errorFlushbar;
  }

  @override
  set errorFlushbar(Flushbar<dynamic>? value) {
    _$errorFlushbarAtom.reportWrite(value, super.errorFlushbar, () {
      super.errorFlushbar = value;
    });
  }

  late final _$successFlushbarAtom =
      Atom(name: 'AppStoreBase.successFlushbar', context: context);

  @override
  Flushbar<dynamic>? get successFlushbar {
    _$successFlushbarAtom.reportRead();
    return super.successFlushbar;
  }

  @override
  set successFlushbar(Flushbar<dynamic>? value) {
    _$successFlushbarAtom.reportWrite(value, super.successFlushbar, () {
      super.successFlushbar = value;
    });
  }

  late final _$signinErrorFlushbarAtom =
      Atom(name: 'AppStoreBase.signinErrorFlushbar', context: context);

  @override
  Flushbar<dynamic>? get signinErrorFlushbar {
    _$signinErrorFlushbarAtom.reportRead();
    return super.signinErrorFlushbar;
  }

  @override
  set signinErrorFlushbar(Flushbar<dynamic>? value) {
    _$signinErrorFlushbarAtom.reportWrite(value, super.signinErrorFlushbar, () {
      super.signinErrorFlushbar = value;
    });
  }

  late final _$responsiblesAtom =
      Atom(name: 'AppStoreBase.responsibles', context: context);

  @override
  List<String>? get responsibles {
    _$responsiblesAtom.reportRead();
    return super.responsibles;
  }

  @override
  set responsibles(List<String>? value) {
    _$responsiblesAtom.reportWrite(value, super.responsibles, () {
      super.responsibles = value;
    });
  }

  late final _$languageAtom =
      Atom(name: 'AppStoreBase.language', context: context);

  @override
  Locale get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(Locale value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  late final _$dismissAllAsyncAction =
      AsyncAction('AppStoreBase.dismissAll', context: context);

  @override
  Future<void> dismissAll() {
    return _$dismissAllAsyncAction.run(() => super.dismissAll());
  }

  late final _$signOutAsyncAction =
      AsyncAction('AppStoreBase.signOut', context: context);

  @override
  Future<void> signOut({bool hasTokenExpired = false}) {
    return _$signOutAsyncAction
        .run(() => super.signOut(hasTokenExpired: hasTokenExpired));
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  void setLanguage(Locale value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setLanguage');
    try {
      return super.setLanguage(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorFlushbar(Flushbar<dynamic>? value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setErrorFlushbar');
    try {
      return super.setErrorFlushbar(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuccessFlushbar(Flushbar<dynamic>? value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setSuccessFlushbar');
    try {
      return super.setSuccessFlushbar(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSigninErrorFlushbar(Flushbar<dynamic>? value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setSigninErrorFlushbar');
    try {
      return super.setSigninErrorFlushbar(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signIn(
      {required String name,
      required String email,
      required String profile,
      required String profileName,
      required String newToken,
      required String expiration,
      required List<PlantEntity> plants,
      required List<SupervisorEntity> supervisors,
      required List<ResponsibleEntity> responsibles}) {
    final _$actionInfo =
        _$AppStoreBaseActionController.startAction(name: 'AppStoreBase.signIn');
    try {
      return super.signIn(
          name: name,
          email: email,
          profile: profile,
          profileName: profileName,
          newToken: newToken,
          expiration: expiration,
          plants: plants,
          supervisors: supervisors,
          responsibles: responsibles);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Duration checkDurationUntilExpireToken() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.checkDurationUntilExpireToken');
    try {
      return super.checkDurationUntilExpireToken();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogged: ${isLogged},
token: ${token},
expirationDate: ${expirationDate},
name: ${name},
email: ${email},
profile: ${profile},
profileName: ${profileName},
plants: ${plants},
supervisors: ${supervisors},
errorFlushbar: ${errorFlushbar},
successFlushbar: ${successFlushbar},
signinErrorFlushbar: ${signinErrorFlushbar},
responsibles: ${responsibles},
language: ${language}
    ''';
  }
}
