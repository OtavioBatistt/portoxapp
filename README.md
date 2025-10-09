# portox_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Comandos de build

Ambiente HML

flutter build apk --flavor hml --dart-define=API_URL=https://portoxmobile-oxiteno-hml-apicast-production.apps.ocp-api.oxiteno.com --dart-define=API_USER_KEY=500d9fee351ec22088afe33e90135d6e --dart-define=API_APP_ID=101 --dart-define=FIREBASE_ANDROID_API_KEY=AIzaSyBzJTBr8ZvebmF26L4ee0xtSH66CMv3t1I --dart-define=FIREBASE_ANDROID_APP_ID=1:673489685958:android:a142141f68ae80b8d7f6c7 --dart-define=FIREBASE_STORAGE_BUCKET=portox-app-hml.appspot.com --dart-define=FIREBASE_PROJECT_ID=portox-app-hml --dart-define=FIREBASE_MESSAGING_SENDER_ID=673489685958 --dart-define=API_SMS=https://send-message-dev.oxiteno.com/sendingportox-sms --dart-define=TRACKING_LINK=https://beta.indoramaventures.com/

Ambiente PRD

flutter build apk --flavor prd --dart-define=API_URL=https://portoxmobile-oxiteno-apicast-production.apps.ocp-api.oxiteno.com --dart-define=API_USER_KEY=392435d7ede9390c91279b35d3522599 --dart-define=API_APP_ID=101 --dart-define=FIREBASE_ANDROID_API_KEY=AIzaSyD7TQw9z1Thj9PZaFTxylgZLHoyolqNF3I --dart-define=FIREBASE_ANDROID_APP_ID=1:573018783318:android:dad213002857aea1e585f7 --dart-define=FIREBASE_STORAGE_BUCKET=portox-app-producao.appspot.com --dart-define=FIREBASE_PROJECT_ID=portox-app-producao --dart-define=FIREBASE_MESSAGING_SENDER_ID=573018783318 --dart-define=API_SMS=https://portoxsendmessage-api.oxiteno.com/sendingportox-sms --dart-define=TRACKING_LINK=https://beta.indoramaventures.com/