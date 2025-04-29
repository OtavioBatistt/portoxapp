import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/checklist_entity.dart';

import 'package:portox_app/app/modules/checklist/domain/repositories/checklist_firebase_repository.dart';

class CreateChecklistUseCase {
  CreateChecklistUseCase({
    required ICreateChecklistRepository checklistRepository,
  }) : _checklistRepository = checklistRepository;
  final ICreateChecklistRepository _checklistRepository;

  Future<Either<Failure, void>> call(ChecklistEntity checklist) async {
    final result = await _checklistRepository.createChecklist(checklist);
    return result.fold(left, right);
  }
}
