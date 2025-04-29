import 'dart:async';

abstract class ISaveTicketDataSource {
  Future<String> saveTicket({
    required String scheduleNumber,
    required String tag,
  });
}
