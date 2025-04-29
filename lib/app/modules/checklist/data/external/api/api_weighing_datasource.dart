import 'package:portox_app/app/commons/adapters/http_client/http_client_adapter.dart';

import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/api_ticket_datasource.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/api_weighing_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/weight_response_entity.dart';

class ApiWeighingDataSource
    implements ISaveTicketDataSource, ILoadWeighingDataSource {
  ApiWeighingDataSource({
    required IHttpClientAdapter client,
  }) : _client = client;

  final IHttpClientAdapter _client;

  @override
  Future<String> saveTicket({
    required String scheduleNumber,
    required String tag,
  }) async {
    try {
      await _client.post<Map<String, dynamic>>(
        '/weighing',
        data: {'schedule_number': scheduleNumber, 'tag': tag},
      );
      return '';
    } on HttpClientError catch (e) {
      if (e.statusCode == 400) {
        return e.message;
      }
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }

  @override
  Future<WeightResponseEntity> loadWeighing({
    required String scheduleNumber,
    required String compartment,
    required String flowCode,
  }) async {
    try {
      final result = await _client.get<Map<String, dynamic>>(
        '/weighing/$scheduleNumber/$compartment/$flowCode',
      );
      final weight = (result.data!['weight'] ?? 0).toDouble();
      final netWeight = (result.data!['net_weight'] ?? 0).toDouble();
      return WeightResponseEntity(weight: weight, netWeight: netWeight);
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }
}
