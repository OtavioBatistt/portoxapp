import 'package:dio/dio.dart';

abstract class DataSourceError implements Exception {
  String? get message;
}

class CommonDataSourceError extends DataSourceError {
  CommonDataSourceError({this.message});

  @override
  final String? message;
}

class HttpDataSourceError extends DataSourceError {
  HttpDataSourceError({
    this.message,
    this.httpError,
  });

  @override
  final String? message;
  final HttpClientError? httpError;
}

class HttpClientError extends DataSourceError implements DioError {
  HttpClientError({
    required this.type,
    required this.message,
    required this.statusCode,
    required this.requestOptions,
    this.data,
    this.error,
    this.response,
    this.stackTrace,
  });

  final int? statusCode;
  final dynamic data;
  @override
  final String message;

  @override
  dynamic error;
  @override
  RequestOptions requestOptions;
  @override
  Response? response;
  @override
  StackTrace? stackTrace;
  @override
  DioErrorType type;
}

class Failure implements Exception {}

class InvalidParams extends Failure {}

class EmptyResponse extends Failure {}

class ClientError extends Failure {}

class NetworkError extends Failure {}
