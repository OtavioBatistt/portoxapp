// ignore_for_file: do_not_use_environment

class Environment {
  static String get apiUrl => const String.fromEnvironment('API_URL');
  static String get apiSms => const String.fromEnvironment('API_SMS');
  static String get apiUserKey => const String.fromEnvironment('API_USER_KEY');
  static String get apiAppId => const String.fromEnvironment('API_APP_ID');
  static String get webApiKey =>
      const String.fromEnvironment('FIREBASE_WEB_API_KEY');
  static String get webAppId =>
      const String.fromEnvironment('FIREBASE_WEB_APP_ID');
  static String get messagingSenderId =>
      const String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');
  static String get projectId =>
      const String.fromEnvironment('FIREBASE_PROJECT_ID');
  static String get webAuthDomain =>
      const String.fromEnvironment('FIREBASE_WEB_AUTH_DOMAIN');
  static String get storageBucket =>
      const String.fromEnvironment('FIREBASE_STORAGE_BUCKET');
  static String get androidApiKey =>
      const String.fromEnvironment('FIREBASE_ANDROID_API_KEY');
  static String get androidAppId =>
      const String.fromEnvironment('FIREBASE_ANDROID_APP_ID');
  static String get trackingLink =>
      const String.fromEnvironment('TRACKING_LINK');
}
