import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:portox_app/app/commons/config/environment.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.'
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }
  }

  static FirebaseOptions web = FirebaseOptions(
    apiKey: Environment.webApiKey,
    appId: Environment.webAppId,
    messagingSenderId: Environment.messagingSenderId,
    projectId: Environment.projectId,
    authDomain: Environment.webAuthDomain,
    storageBucket: Environment.storageBucket,
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: Environment.androidApiKey,
    appId: Environment.androidAppId,
    messagingSenderId: Environment.messagingSenderId,
    projectId: Environment.projectId,
    storageBucket: Environment.storageBucket,
  );
}
