import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';

String formatWindowAndLocation(
    BuildContext context, DateTime date, String location) {
  final day = date.day;
  final month = intl(context, 'app.month-${date.month}');
  final year = date.year;
  final hour = date.hour;
  final minute = date.minute;
  final weekday = intl(context, 'app.weekday-${date.weekday}');
  return '$day-$month-$year $hour:$minute ($weekday) - $location';
}
