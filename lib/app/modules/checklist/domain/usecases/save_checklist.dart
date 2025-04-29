import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';

import 'package:portox_app/app/modules/checklist/domain/repositories/save_checklist_repository.dart';

class SaveChecklistUseCase {
  SaveChecklistUseCase({
    required ISaveChecklistRepository checklistRepository,
  }) : _checklistRepository = checklistRepository;
  final ISaveChecklistRepository _checklistRepository;

  Future<Either<Failure, void>> call({
    required String flowCode,
    required String scheduleNumber,
    int? compartment,
  }) async {
    final result = await _checklistRepository.saveChecklist(
      flowCode: flowCode,
      scheduleNumber: scheduleNumber,
      compartment: compartment,
    );
    return result.fold(left, right);
  }
}
