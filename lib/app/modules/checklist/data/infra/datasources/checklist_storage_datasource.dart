import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_seal_entity.dart';

abstract class IRemoveChecklistDataSource {
  Future<void> removeChecklist(IsarChecklistEntity params);
}

abstract class ISaveChecklistDataSource {
  Future<void> saveChecklist(IsarChecklistEntity params);
}

abstract class ILoadChecklistDataSource {
  Future<List<IsarChecklistEntity>> loadChecklist(String scheduleNumber);
}

abstract class ISaveChecklistSealDataSource {
  Future<void> saveChecklistSeal(IsarChecklistSealEntity params);
}

abstract class ILoadChecklistSealDataSource {
  Future<bool> loadChecklistSeal(String sealCode);
}
