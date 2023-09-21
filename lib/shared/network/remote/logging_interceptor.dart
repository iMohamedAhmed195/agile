import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  final int maxCharactersPerLine = 200;
  static  String? errorMessage;
  static  String? SuccessMessage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("--> onRequest${options.method} ${options.path}");
    debugPrint("Headers: onRequest${options.headers}");
    debugPrint("parameters:onRequest ${options.queryParameters}");
    if(options.data != null){
      debugPrint("body data: ${options.data}");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    SuccessMessage = response.statusMessage;
    debugPrint("<--onResponse [${response.statusCode}] ${response.requestOptions.path}");
    debugPrint(" onResponse ${response.data}".replaceAll('\n', ' '));
    debugPrint("-----");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    errorMessage = err.response!.statusMessage;
    log("!!! API ERROR [${err.response?.statusCode}] => path: ${err.requestOptions.path}");
    debugPrint("error message: ${err.message}\nresponse: ${err.response}");
    return super.onError(err, handler);
  }
}