import 'package:portox_app/app/modules/checklist/domain/entities/seal_response_entity.dart';

abstract class IValidateSealsDataSource {
  Future<SealResponseEntity> validateSeals({
    required String scheduleNumber,
    required String seal,
  });
}
