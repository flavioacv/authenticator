import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('\x1B[31m Method: ${err.requestOptions.method}\x1B[0m');
    log('\x1B[31m Path: ${err.requestOptions.path}\x1B[0m');
    log('\x1B[31m Error: ${err.error}\x1B[0m');
    log('\x1B[31m Data da request: ${err.requestOptions.data}\x1B[0m');
    log('\x1B[31m Data da response:${err.response?.data}\x1B[0m');
    log('\x1B[31m Type: ${err.type}\x1B[0m');

    super.onError(err, handler);
  }
}
