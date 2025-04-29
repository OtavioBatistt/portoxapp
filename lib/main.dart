import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/app_module.dart';
import 'package:portox_app/app/app_widget.dart';
import 'package:portox_app/app/commons/config/firebase_options.dart';

void main() async {
  debugPrint('App starting: ${DateTime.now()}');
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  debugPrint('App loaded: ${DateTime.now()}');
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
