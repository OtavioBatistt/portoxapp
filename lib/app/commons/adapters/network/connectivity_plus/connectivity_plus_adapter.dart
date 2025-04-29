import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/adapters/network/network_adapter.dart';

class NetworkConnectivityAdapter implements INetworkAdapter {
  NetworkConnectivityAdapter({
    required this.baseURL,
    required this.connectivity,
  });
  final String baseURL;
  final Connectivity connectivity;

  @override
  StreamSubscription check(Function(bool) onListenChange) =>
      connectivity.onConnectivityChanged.listen((result) async {
        bool isOnline;
        try {
          await Future.delayed(const Duration(seconds: 1), () {});
          final testConnection = await InternetAddress.lookup('google.com');
          isOnline = testConnection.isNotEmpty &&
              testConnection[0].rawAddress.isNotEmpty;
        } on SocketException {
          isOnline = false;
        }
        debugPrint('Has connection: $isOnline ${DateTime.now()}');
        onListenChange(isOnline);
      });
}
