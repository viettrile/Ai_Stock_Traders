import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:getx_structure/modules/auth/data/datasource/auth_datasource.dart';
import 'package:getx_structure/services/network/dio_provider.dart';

import '../../../../core/core.dart';
import '../dtos/auth_dto.dart';

class AuthDataSourceImpl extends BaseRemoteDataSource
    implements AuthDataSource {
  final Dio _dio;

  AuthDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<DataError, AuthDto>> login(
      String username, String password) async {
    try {
      final response = await _dio
          .post('${DioProvider.baseUrl}${DioProvider.endPointLogin}', data: {
        "userName": username,
        "password": password,
        
      });

      if (response.data["returnCode"] == "11") {
        return Left(DataError(message: "Sai tên đăng nhập hoặc mật khẩu"));
      } else {
        final authDto = AuthDto.fromJson(response.data);
        return Right(authDto);
      }
    } catch (_) {
      return Left(DataError());
    }
  }

  @override
  Future<Either<DataError, AuthDto>> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post('/refresh', data: {
        'refreshToken': refreshToken,
      });
      return Right(AuthDto.fromJson(response.data));
    } catch (error) {
      return Left(DataError());
    }
  }
}
