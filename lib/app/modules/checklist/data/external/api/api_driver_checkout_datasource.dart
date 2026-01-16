import 'package:portox_app/app/commons/adapters/http_client/http_client_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';

class ApiDriverCheckoutDataSource {
  ApiDriverCheckoutDataSource({
    required IHttpClientAdapter client,
  }) : _client = client;

  final IHttpClientAdapter _client;

  Future<Map<String, dynamic>> getDriverCheckout({
    required String scheduleNumber,
  }) async {
    try {
      final result = await _client.get<Map<String, dynamic>>(
        '/flow/driverSignature/$scheduleNumber',
      );

      final data = result.data ?? <String, dynamic>{};

      return {
        'id': data['id'],
        'scheduleNumber': data['schedule_number'] ?? '',
        'arrivalDate': data['arrival_date'] ?? '',
        'checkoutDate': data['checkout_date'] ?? '',
        'question': data['question'] ?? '',
        'time': data['time'] ?? '',
      };
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }
}
