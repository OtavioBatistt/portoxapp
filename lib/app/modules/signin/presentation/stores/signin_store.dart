import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/domain/usecases/signin.dart';

part 'signin_store.g.dart';

class SignInStore = SignInStoreBase with _$SignInStore;

enum SignInStatus {
  initial,
  loading,
  success,
  error,
  invalidParams,
  networkError
}

abstract class SignInStoreBase with Store {
  SignInStoreBase(
    this.appStore,
    this.signIn,
  );
  final AppStore appStore;
  final SignInUseCase signIn;

  @observable
  ValueNotifier<SignInStatus> status = ValueNotifier(SignInStatus.initial);
  @observable
  String username = '';
  @observable
  String password = '';

  @action
  void setStatus(SignInStatus value) => status.value = value;
  @action
  void setUsername(String value) => username = value;
  @action
  void setPassword(String value) => password = value;

  @action
  Future onSubmit(BuildContext context) async {
    setStatus(SignInStatus.loading);
    final response = await submit(context);
    setStatus(response);
  }

  Future<SignInStatus> submit(BuildContext context) async {
    final result = await signIn.call(username, password);
    return result.fold(
      (e) {
        if (e is InvalidParams) {
          return SignInStatus.invalidParams;
        } else if (e is NetworkError) {
          return SignInStatus.networkError;
        }
        return SignInStatus.error;
      },
      (response) {
        setUsername('');
        setPassword('');
        Modular.to.navigate('/schedule/');
        appStore.signIn(
          newToken: response.token,
          expiration: response.expirationDate,
          name: response.name,
          email: response.email,
          plants: response.plants,
          profile: response.profile,
          profileName: response.profileName,
          supervisors: response.supervisors,
          responsibles: response.responsibles,
        );
        return SignInStatus.success;
      },
    );
  }
}
