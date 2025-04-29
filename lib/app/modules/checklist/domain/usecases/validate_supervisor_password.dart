import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/adapters/cryptography/cryptography_adapter.dart';
import 'package:portox_app/app/commons/default_errors.dart';

import 'package:portox_app/app/modules/signin/data/infra/entities/supervisor_entity.dart';

class ValidateSupervisorPasswordUseCase {
  ValidateSupervisorPasswordUseCase({
    required ICryptographyAdapter cryptoRepository,
  }) : _cryptoRepository = cryptoRepository;
  final ICryptographyAdapter _cryptoRepository;

  Future<Either<Failure, bool>> call({
    required SupervisorEntity supervisor,
    required String password,
  }) async {
    final supervisorPassword = supervisor.password;
    final cryptoPassword = await _cryptoRepository.hash(password);
    return right(cryptoPassword == supervisorPassword);
  }
}
