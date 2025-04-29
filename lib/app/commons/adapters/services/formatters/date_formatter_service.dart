import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portox_app/app/commons/adapters/services/formatters/date_formatter_service_adapter.dart';

class DateService implements IDateServiceAdapter {
  @override
  String formatDayMonthYear(DateTime date) {
    final dayMonth = formatDayMonth(date);
    return '$dayMonth/${date.year}';
  }

  @override
  String formatDayMonth(DateTime date) {
    final day = '${date.day}'.padLeft(2, '0');
    final month = '${date.month}'.padLeft(2, '0');
    return '$day/$month';
  }

  @override
  String formatHourMinute(DateTime date) {
    final hours = '${date.hour}'.padLeft(2, '0');
    final minutes = '${date.minute}'.padLeft(2, '0');
    return '$hours:$minutes';
  }

  @override
  DateTime timestampToDate(Timestamp timestamp) {
    return DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch,
        isUtc: false);
  }
}
