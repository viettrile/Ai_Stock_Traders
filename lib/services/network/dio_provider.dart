import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import 'request_headers.dart';

class DioProvider {
 
  //server
  static String baseUrl = 'https://stocktraders.vn';

 
  static String endPointLogin = '/Authentication/signIn';
  static String endPointStockPrice = '/service/data/getTotalTradeReal';

  static Dio? _instance;

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);
      _addInterceptors(_instance!);
      return _instance!;
    }
    return _instance!;
  }

  static Dio get tokenClient {
    Dio dio = Dio(_options);
    _addInterceptors(dio);
    return dio;
  }

  static Dio get dioWithHeaderToken {
    Dio dio = Dio(_options);
    _addInterceptors(dio);
    return dio;
  }

  static _addInterceptors(Dio dio) {
    dio.interceptors.clear();
    dio.interceptors.add(RequestHeaderInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
          ),
        ),
      );
    }
    
  }

  static Future<void> clearTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
  }

  static Future<void> saveAccessToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', token);
  }
}
