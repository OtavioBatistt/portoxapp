import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

final lightTheme = ThemeData(
  fontFamily: Ox.fonts.app,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Ox.colors.blue,
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    backgroundColor: Ox.colors.green,
    foregroundColor: Ox.colors.black,
  )),
);
