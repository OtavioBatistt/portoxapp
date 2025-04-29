import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/app_store.dart';

class CustomInterceptors extends InterceptorsWrapper {
  CustomInterceptors({
    required this.userKey,
    required this.appStore,
  });
  final AppStore appStore;
  final String userKey;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    debugPrint('API BaseURL: ${options.baseUrl}');
    debugPrint('API Endpoint: ${options.method} ${options.path}');
    if (options.data != null) {
      debugPrint('API Payload: ${json.encode(options.data)}');
    }
    final headers = <String, String>{
      'user_key': userKey,
      'Language':
          '${appStore.language.languageCode}_${appStore.language.countryCode}',
    };

    if (appStore.token.isNotEmpty) {
      headers.addAll({'Token': appStore.token});
    }

    options.headers.addAll(headers);
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint('API Response: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    HttpClientError failure;
    if (err.response?.statusCode == 401) {
      failure = HttpClientError(
        message: 'Falha ao realizar login.',
        requestOptions: err.requestOptions,
        statusCode: err.response?.statusCode,
        stackTrace: err.stackTrace,
        type: err.type,
        data: err.requestOptions.data,
        error: err,
        response: err.response,
      );
    } else {
      failure = HttpClientError(
        requestOptions: err.requestOptions,
        statusCode: err.response?.statusCode,
        stackTrace: err.stackTrace,
        type: err.type,
        data: err.requestOptions.data,
        error: err,
        response: err.response,
        message: err.response?.data['Error'] ??
            'Ocorreu um erro na requisição com o servidor',
      );
    }
    debugPrint('API Error: ${failure.statusCode} ${failure.message}');
    handler.next(failure);
  }
}
