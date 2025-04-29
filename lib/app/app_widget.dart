import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/commons/adapters/localizations/localizations_app.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/styles/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/sign-in/splash');
    final appStore = Modular.get<AppStore>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Portox',
      theme: lightTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        LocalizationsApp.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocale) =>
          supportedLocale.firstWhere(
        (e) {
          appStore.setLanguage(e);
          return e.languageCode == locale?.languageCode &&
              e.countryCode == locale?.countryCode;
        },
        orElse: () => supportedLocale.first,
      ),
    );
  }
}
