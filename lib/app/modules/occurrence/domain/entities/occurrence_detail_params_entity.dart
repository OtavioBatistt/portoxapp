import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

class OccurrenceDetailParamsEntity {
  OccurrenceDetailParamsEntity({
    required this.occurrence,
    required this.schedule,
  });

  OccurrenceEntity occurrence;
  ScheduleEntity schedule;
}
