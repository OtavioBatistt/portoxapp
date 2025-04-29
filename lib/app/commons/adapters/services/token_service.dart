import 'dart:async';

import 'package:portox_app/app/commons/adapters/services/token_service_adapter.dart';
import 'package:portox_app/app/commons/app_store.dart';

class TokenService implements ITokenServiceAdapter {
  TokenService(this.appStore);
  final AppStore appStore;
  static Timer? _timer;

  @override
  void startNewTimer() {
    stopTimer();
    if (appStore.token.isNotEmpty) {
      _timer = Timer.periodic(appStore.checkDurationUntilExpireToken(), (_) {
        timedOut();
      });
    }
  }

  @override
  void stopTimer() {
    if (_timer != null || (_timer?.isActive != null && _timer!.isActive)) {
      _timer?.cancel();
    }
  }

  @override
  Future<void> timedOut() async {
    stopTimer();
    if (appStore.token.isNotEmpty) {
      await appStore.signOut(hasTokenExpired: true);
    }
  }
}
