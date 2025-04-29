import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';

import 'package:portox_app/app/modules/checklist/domain/repositories/save_ticket_repository.dart';

class SaveTicketUseCase {
  SaveTicketUseCase({
    required ISaveTicketRepository ticketRepository,
  }) : _ticketRepository = ticketRepository;
  final ISaveTicketRepository _ticketRepository;

  Future<Either<Failure, String>> call({
    required String scheduleNumber,
    required String tag,
  }) async {
    final result = await _ticketRepository.saveTicket(
      scheduleNumber: scheduleNumber,
      tag: tag,
    );
    return result.fold(left, right);
  }
}
