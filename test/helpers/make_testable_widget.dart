import 'package:flutter/material.dart';

Widget makeTestableWidget({
  required Widget child,
  NavigatorObserver? navigatorObserver,
}) {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final navigatorKey = GlobalKey<NavigatorState>();

  return MaterialApp(
    scaffoldMessengerKey: scaffoldMessengerKey,
    navigatorKey: navigatorKey,
    home: child,
  );
}
