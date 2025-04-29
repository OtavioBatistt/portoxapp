import 'package:dio/dio.dart';
import 'package:portox_app/app/commons/adapters/http_client/http_client_adapter.dart';
import 'package:portox_app/app/commons/adapters/http_client/http_response.dart';
import 'package:portox_app/app/commons/default_errors.dart';

class DioAdapter implements IHttpClientAdapter {
  DioAdapter({
    required this.dio,
    this.interceptors,
  }) {
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors!);
    }
  }
  final Dio dio;
  final List<InterceptorsWrapper>? interceptors;

  @override
  Future<HttpResponse<T>> get<T>(
    String path, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final result = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      final response = HttpResponse<T>(
        data: result.data,
        headers: result.headers.map,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioError catch (e) {
      throw HttpClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioErrorType.response,
        message: e.message,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  Future<HttpResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final result = await dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      final response = HttpResponse<T>(
        data: result.data,
        headers: result.headers.map,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioError catch (e) {
      throw HttpClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioErrorType.response,
        message: e.message,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  Future<HttpResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final result = await dio.put(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      final response = HttpResponse<T>(
        data: result.data,
        headers: result.headers.map,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioError catch (e) {
      throw HttpClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioErrorType.response,
        message: e.message,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  Future<HttpResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final result = await dio.delete(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      final response = HttpResponse<T>(
        data: result.data,
        headers: result.headers.map,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioError catch (e) {
      throw HttpClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioErrorType.response,
        message: e.message,
        requestOptions: e.requestOptions,
      );
    }
  }
}
