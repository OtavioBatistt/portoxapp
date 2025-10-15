import 'package:flutter/foundation.dart';
import 'package:portox_app/app/commons/adapters/http_client/http_client_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';

class ApiDriverCheckoutDataSource {
  ApiDriverCheckoutDataSource({
    required IHttpClientAdapter client,
  }) : _client = client;

  final IHttpClientAdapter _client;

  Future<Map<String, String>> getDriverCheckout({
    required String scheduleNumber,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      final simulatedResponse = {
        'entry_date': '2025-10-15T08:45:00Z',
        'exit_date': '2025-10-15T12:30:00Z',
      };

      final entryDate = simulatedResponse['entry_date'] ?? '';
      final exitDate = simulatedResponse['exit_date'] ?? '';

      return {
        'entryDate': entryDate,
        'exitDate': exitDate,
      };
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }

  Future<void> postDriverCheckout({
    required String scheduleNumber,
    required String totalTime,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      debugPrint('✅ Tempo total enviado com sucesso: ${totalTime}');
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }

  // Future<Map<String, String>> getDriverCheckout({
  //   required String scheduleNumber,
  // }) async {
  //   try {
  //     final result = await _client.get<Map<String, dynamic>>(
  //       '/driver-checkout/$scheduleNumber',
  //     );

  //     final entryDate = result.data?['entry_date'] ?? '';
  //     final exitDate = result.data?['exit_date'] ?? '';

  //     return {
  //       'entryDate': entryDate,
  //       'exitDate': exitDate,
  //     };
  //   } on HttpClientError catch (e) {
  //     throw HttpDataSourceError(httpError: e, message: e.message);
  //   } on Exception {
  //     throw HttpDataSourceError(message: 'Unexpected error');
  //   }
  // }

  // Future<void> postDriverCheckout({
  //   required String scheduleNumber,
  //   required String totalTime,
  // }) async {
  //   try {
  //     await _client.post<Map<String, dynamic>>(
  //       '/driver-checkout',
  //       data: {
  //         'schedule_number': scheduleNumber,
  //         'total_time': totalTime,
  //       },
  //     );
  //   } on HttpClientError catch (e) {
  //     throw HttpDataSourceError(httpError: e, message: e.message);
  //   } on Exception {
  //     throw HttpDataSourceError(message: 'Unexpected error');
  //   }
  // }
}
