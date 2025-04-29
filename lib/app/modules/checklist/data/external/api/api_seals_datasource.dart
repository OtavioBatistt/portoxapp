import 'package:portox_app/app/commons/adapters/http_client/http_client_adapter.dart';

import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/api_seal_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/seal_response_entity.dart';

class ApiSealsDataSource implements IValidateSealsDataSource {
  ApiSealsDataSource({
    required IHttpClientAdapter client,
  }) : _client = client;

  final IHttpClientAdapter _client;

  @override
  Future<SealResponseEntity> validateSeals({
    required String scheduleNumber,
    required String seal,
  }) async {
    try {
      final result = await _client.get<Map<String, dynamic>>(
        '/util/validateSeals/$scheduleNumber/$seal',
      );
      return SealResponseEntity(
        isValid: result.data!['validated'],
        errorMessage: result.data!['error'] ?? '',
      );
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }
}
