import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/signin_response_entity.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/storage_credentials_entity.dart';
import 'package:portox_app/app/modules/signin/domain/repositories/save_credentials_repository.dart';
import 'package:portox_app/app/modules/signin/domain/repositories/signin_repository.dart';
import 'package:portox_app/app/modules/signin/domain/usecases/signin_external.dart';

class SignInUseCase {
  SignInUseCase({
    required SignInExternal signInExternalUseCase,
    required ISignInRepository signInRepository,
    required ISaveCredentialsRepository saveCredentialsRepository,
  })  : _signInExternalUseCase = signInExternalUseCase,
        _signInRepository = signInRepository,
        _saveCredentialsRepository = saveCredentialsRepository;

  final SignInExternal _signInExternalUseCase;
  final ISignInRepository _signInRepository;
  final ISaveCredentialsRepository _saveCredentialsRepository;

  Future<Either<Failure, SignInResponseEntity>> call(
    String username,
    String password,
  ) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      final result = await _signInRepository.signIn(username, password);
      return result.fold(
        left,
        (r) async {
          final externalResult =
              await _signInExternalUseCase.call(r.email, password);

          return externalResult.fold(left, (_) async {
            unawaited(
              _saveCredentialsRepository.saveCredentials(
                StorageCredentialsEntity(
                  token: r.token,
                  expirationDate: r.expirationDate,
                ),
              ),
            );
            return right(r);
          });
        },
      );
    } else {
      return left(InvalidParams());
    }
  }
}
