import 'package:agile/shared/network/remote/logging_interceptor.dart';
import 'package:dio/dio.dart';


class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://tasksapp.integration25.com/api',
        receiveDataWhenStatusError: true,
      ),
    );

    final loggingInterceptor = LoggingInterceptor();

    dio.interceptors.add(loggingInterceptor);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
     Object? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': 'Bearer $token'
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': 'Bearer $token'
    };
    return await dio.put(url, queryParameters: query, data: data);
  }
  
  static Future<Response> deleteData({
    required String url,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return await dio.delete(url, );
  }
}


