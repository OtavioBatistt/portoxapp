import 'package:portox_app/app/modules/signin/data/infra/entities/signin_response_entity.dart';

abstract class ISignInDataSource {
  Future<SignInResponseEntity> signIn(String email, String password);
}
