import 'dart:async';

abstract class INetworkAdapter {
  StreamSubscription check(Function(bool) onListenChange);
}
