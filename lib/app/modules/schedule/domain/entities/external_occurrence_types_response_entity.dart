import 'package:portox_app/app/commons/domain/occurrence_type_entity.dart';

class ExternalOccurrenceTypesResponseEntity {
  ExternalOccurrenceTypesResponseEntity({
    required this.removeList,
    required this.updateList,
  });

  List<OccurrenceTypeEntity> updateList;
  List<String> removeList;
}
