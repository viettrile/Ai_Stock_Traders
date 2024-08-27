import 'package:fpdart/fpdart.dart';
import 'package:getx_structure/modules/auth/data/dtos/auth_dto.dart';

import '../../../../core/core.dart';

abstract class AuthDataSource {
  Future<Either<DataError, AuthDto>> login(String username, String password);
  Future<Either<DataError, AuthDto>> refreshToken(String refreshToken);
}
