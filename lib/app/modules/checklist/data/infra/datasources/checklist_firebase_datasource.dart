import 'dart:async';

import 'package:portox_app/app/commons/domain/checklist_entity.dart';

abstract class ICreateChecklistDataSource {
  Future<void> createChecklist(ChecklistEntity checklist);
}
