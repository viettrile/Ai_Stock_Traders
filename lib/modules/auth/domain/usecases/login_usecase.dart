import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../data/dtos/auth_dto.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

    Future<Either<DataError, AuthDto>> login(
      String username, String password) {
    return _authRepository.login(username, password);
  }
  Future<Either<DataError, AuthDto>> refreshToken(String refreshToken) async =>
      _authRepository.refreshToken(refreshToken);
}
