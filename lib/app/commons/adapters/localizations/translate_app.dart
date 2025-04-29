import 'package:flutter/widgets.dart';
import 'package:portox_app/app/commons/adapters/localizations/localizations_app.dart';

String intl(BuildContext context, String key) =>
    LocalizationsApp.of(context)?.translate(key) ?? '';
