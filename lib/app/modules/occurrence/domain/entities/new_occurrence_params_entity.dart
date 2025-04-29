import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';

class NewOccurrenceParamsEntity {
  NewOccurrenceParamsEntity({
    required this.schedule,
    this.selectedItem,
  });

  ScheduleEntity schedule;
  LineEntity? selectedItem;
}
