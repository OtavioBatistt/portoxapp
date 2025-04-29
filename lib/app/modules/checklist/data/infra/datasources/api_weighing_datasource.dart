import 'dart:async';

import 'package:portox_app/app/modules/checklist/domain/entities/weight_response_entity.dart';

abstract class ILoadWeighingDataSource {
  Future<WeightResponseEntity> loadWeighing({
    required String scheduleNumber,
    required String compartment,
    required String flowCode,
  });
}
