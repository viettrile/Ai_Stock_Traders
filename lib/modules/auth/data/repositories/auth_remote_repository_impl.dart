import 'package:fpdart/fpdart.dart';
import 'package:getx_structure/core/core.dart';
import 'package:getx_structure/modules/auth/data/datasource/auth_datasource.dart';
import 'package:getx_structure/modules/auth/data/dtos/auth_dto.dart';
import 'package:getx_structure/modules/auth/domain/repositories/auth_repository.dart';

class AuthRemoteRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRemoteRepositoryImpl({required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;

   @override
  Future<Either<DataError, AuthDto>> login(
      String username, String password) async {
    return _authDataSource.login(username, password);
  }

  @override
  Future<Either<DataError, AuthDto>> refreshToken(String refreshToken) async {
    final result = await _authDataSource.refreshToken(refreshToken);
    return result.fold(
      (error) => Left(error),
      (authDto) => Right(authDto),
    );
  }
}
