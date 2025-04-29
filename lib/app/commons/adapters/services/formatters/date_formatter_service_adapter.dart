import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IDateServiceAdapter {
  String formatDayMonth(DateTime date);
  String formatDayMonthYear(DateTime date);
  String formatHourMinute(DateTime date);
  DateTime timestampToDate(Timestamp timestamp);
}
