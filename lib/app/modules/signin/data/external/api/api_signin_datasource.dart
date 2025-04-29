import 'package:portox_app/app/commons/adapters/http_client/http_client_adapter.dart';

import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/data/infra/datasources/signin_datasource.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/signin_response_entity.dart';

class ApiSignInDataSource implements ISignInDataSource {
  ApiSignInDataSource({
    required String appId,
    required IHttpClientAdapter client,
  })  : _client = client,
        _appId = appId;

  final IHttpClientAdapter _client;
  final String _appId;

  @override
  Future<SignInResponseEntity> signIn(String username, String password) async {
    try {
      final result = await _client.post<Map<String, dynamic>>(
        "/security/authentication",
        data: {'username': username, 'password': password, "app_id": _appId},
      );
      result.data!['token'] = result.headers['token']!.first;
      return SignInResponseEntity.fromMap(result.data)!;
    } on HttpClientError catch (e) {
      throw HttpDataSourceError(httpError: e, message: e.message);
    } on Exception {
      throw HttpDataSourceError(message: 'Unexpected error');
    }
  }
}
