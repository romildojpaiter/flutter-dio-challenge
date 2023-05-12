import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:taskapp/back4app/back4app_dio_interceptor.dart';

class Back4AppDioCustom {
  final Dio _dio = Dio();

  Back4AppDioCustom() {
    _dio.options.headers["Content-type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("BACK4APP_BASEURL");
    _dio.interceptors.add(Back4appDioInterceptor());
  }

  Dio get dio => _dio;
}
