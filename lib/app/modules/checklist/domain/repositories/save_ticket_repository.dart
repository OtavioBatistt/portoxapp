import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';

abstract class ISaveTicketRepository {
  Future<Either<Failure, String>> saveTicket({
    required String scheduleNumber,
    required String tag,
  });
}
