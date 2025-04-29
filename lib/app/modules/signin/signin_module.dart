import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/commons/config/environment.dart';
import 'package:portox_app/app/modules/signin/data/external/api/api_signin_datasource.dart';
import 'package:portox_app/app/modules/signin/data/external/storage/local_storage_user_datasource.dart';
import 'package:portox_app/app/modules/signin/data/infra/repositories/save_credentials_repository_impl.dart';
import 'package:portox_app/app/modules/signin/data/infra/repositories/signin_repository_impl.dart';
import 'package:portox_app/app/modules/signin/domain/usecases/signin.dart';
import 'package:portox_app/app/modules/signin/domain/usecases/signin_external.dart';
import 'package:portox_app/app/modules/signin/presentation/pages/signin_page.dart';
import 'package:portox_app/app/modules/signin/presentation/pages/splash_page.dart';
import 'package:portox_app/app/modules/signin/presentation/stores/signin_store.dart';

class SignInModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => SignInStore(i(), i())),
        Bind.factory(
          (i) => SignInExternal(
            signInRepository: i(),
            createRepository: i(),
          ),
        ),
        Bind.factory(
          (i) => SignInUseCase(
            signInExternalUseCase: i(),
            signInRepository: i(),
            saveCredentialsRepository: i(),
          ),
        ),
        Bind.factory((i) => SignInRepository(dataSource: i())),
        Bind.factory((i) =>
            ApiSignInDataSource(appId: Environment.apiAppId, client: i())),
        Bind.factory((i) => SaveCredentialsRepository(dataSource: i())),
        Bind.factory((i) => LocalStorageUserDataSource(storage: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => SignInPage(
              store: Modular.get(),
              hasTokenExpired: args.queryParams['hasTokenExpired']),
        ),
        ChildRoute(
          '/splash',
          child: (_, args) => SplashPage(masterStore: Modular.get()),
        ),
      ];
}
