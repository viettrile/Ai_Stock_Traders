import 'package:dio/dio.dart';

import 'package:getx_structure/services/network/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  final Dio _dio = Dio();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final loginUrl = DioProvider.baseUrl + DioProvider.endPointLogin;
    if (options.uri.toString() != loginUrl) {
      final customHeaders = await getCustomHeaders();
      options.headers.addAll(customHeaders);
    }
    handler.next(options);
  }

  Future<Map<String, String>> getCustomHeaders() async {
    var customHeaders = {
      'content-type': 'application/json',
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    if (accessToken != null && accessToken.trim().isNotEmpty) {
      customHeaders.addAll({'Authorization': "Bearer $accessToken"});
    }
    return customHeaders;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await DioProvider.clearTokens();
    }
    return handler.next(err);
  }

  

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final opts = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: opts,
    );
  }
}
