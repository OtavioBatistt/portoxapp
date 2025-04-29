import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:portox_app/app/commons/domain/plant_entity.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/responsibles_entity.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/supervisor_entity.dart';
import 'package:portox_app/app/modules/signin/domain/usecases/signout_external.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  AppStoreBase(this._signOutExternal);
  final SignOutExternal _signOutExternal;

  @observable
  bool isLogged = false;

  @observable
  String token = '';
  @observable
  String expirationDate = '';
  @observable
  String name = '';
  @observable
  String email = '';
  @observable
  String profile = '';
  @observable
  String profileName = '';
  @observable
  List<PlantEntity> plants = [];
  @observable
  List<SupervisorEntity> supervisors = [];
  @observable
  Flushbar? errorFlushbar;
  @observable
  Flushbar? successFlushbar;
  @observable
  Flushbar? signinErrorFlushbar;
  @observable
  List<String>? responsibles = [];

  @observable
  Locale language = const Locale('pt', 'BR');

  void _setToken(String value) => token = value;
  void _setName(String value) => name = value;
  void _setEmail(String value) => email = value;
  void _setProfile(String value) => profile = value;
  void _setProfileName(String value) => profileName = value;
  void _setExpirationDate(String value) => expirationDate = value;
  void _setPlants(List<PlantEntity> value) => plants = value;
  void _setSupervisors(List<SupervisorEntity> value) => supervisors = value;
  void _setResponsibles(List<String> value) => responsibles = value;

  @action
  void setLanguage(Locale value) => language = value;
  @action
  void setErrorFlushbar(Flushbar? value) => errorFlushbar = value;
  @action
  void setSuccessFlushbar(Flushbar? value) => successFlushbar = value;
  @action
  void setSigninErrorFlushbar(Flushbar? value) => signinErrorFlushbar = value;

  Future<void> _dismiss(Flushbar? flushbar) async {
    if ((flushbar?.isDismissible ?? false) &&
        (flushbar?.isShowing() ?? false)) {
      await flushbar?.dismiss();
    }
  }

  @action
  Future<void> dismissAll() async {
    await _dismiss(errorFlushbar);
    await _dismiss(successFlushbar);
    await _dismiss(signinErrorFlushbar);
  }

  @action
  Future<void> signOut({bool hasTokenExpired = false}) async {
    isLogged = false;
    _setToken('');
    _setName('');
    _setPlants([]);
    _setProfile('');
    _setSupervisors([]);
    _setExpirationDate('');
    _setResponsibles([]);
    if (hasTokenExpired) {
      Modular.to.navigate('/sign-in/?hasTokenExpired=true');
    } else {
      Modular.to.navigate('/sign-in/');
    }
    await _signOutExternal.call();
  }

  @action
  void signIn({
    required String name,
    required String email,
    required String profile,
    required String profileName,
    required String newToken,
    required String expiration,
    required List<PlantEntity> plants,
    required List<SupervisorEntity> supervisors,
    required List<ResponsibleEntity> responsibles,
  }) {
    isLogged = true;
    _setName(name);
    _setEmail(email);
    _setPlants(plants);
    _setToken(newToken);
    _setProfile(profile);
    _setProfileName(profileName);
    _setSupervisors(supervisors);
    _setExpirationDate(expiration);

    //Cria lista de responsibles
    List<String> descriptions = [];
    for (var responsible in responsibles) {
      descriptions.add(responsible.functionDescription);
    }
    _setResponsibles(descriptions);
  }

  @action
  Duration checkDurationUntilExpireToken() {
    final today = DateTime.now().toLocal();
    final expiration = DateTime.parse(expirationDate.replaceAll('Z', ''));
    final duration = expiration.difference(today);
    return duration;
  }
}
