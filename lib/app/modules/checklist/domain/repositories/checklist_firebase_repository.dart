import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/checklist_entity.dart';

abstract class ICreateChecklistRepository {
  Future<Either<Failure, void>> createChecklist(ChecklistEntity checklist);
}
