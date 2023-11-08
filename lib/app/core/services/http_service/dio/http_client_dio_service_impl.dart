import 'package:authenticator/app/core/services/http_service/http_exception.dart';
import 'package:authenticator/app/core/services/http_service/http_service_mixin.dart';
import 'package:authenticator/app/core/services/http_service/interceptor/logger_error_interceptor.dart';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';


import '../http_client_service.dart';
import '../http_response.dart';

class HttpClientDioServiceImpl extends HttpClientService with HttpServiceMixin {
  final Dio dio;
 // final InternetConnectionService internetConnectionService;

  HttpClientDioServiceImpl({
    required this.dio,
   // required this.internetConnectionService,
  }) {
    if (kDebugMode) {
      dio.interceptors.add(LoggerErrorInterceptor());
    }
  }

  @override
  Future<HttpResponse> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      //await throwErrorIfNotConnectionWithInternet(internetConnectionService);

      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
      );

      final data = response.data;

      throwErroIfHasInRequest(data);

      return HttpResponse(
        data: data,
      );
    } on DioException catch (exception) {
      throw HttpException(
        exception.message ?? 'Ops! Algo deu errado.',
        stackTrace: exception.stackTrace,
      );
    }
  }

  @override
  Future<HttpResponse> delete(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
    //  await throwErrorIfNotConnectionWithInternet(internetConnectionService);

      final response = await dio.delete(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      final data = response.data;

      throwErroIfHasInRequest(data);

      return HttpResponse(
        data: data,
      );
    } on DioException catch (exception) {
      throw HttpException(
        exception.message ?? 'Ops! Algo deu errado.',
        stackTrace: exception.stackTrace,
      );
    }
  }

  @override
  Future<HttpResponse> post(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
    //  await throwErrorIfNotConnectionWithInternet(internetConnectionService);

      final response = await dio.post(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      final data = response.data;

      throwErroIfHasInRequest(data);

      return HttpResponse(
        data: data,
      );
    } on DioException catch (exception) {
      throw HttpException(
        exception.message ?? 'Ops! Algo deu errado.',
        stackTrace: exception.stackTrace,
      );
    }
  }

  @override
  Future<HttpResponse> put(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
     // await throwErrorIfNotConnectionWithInternet(internetConnectionService);

      final response = await dio.put(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      final data = response.data;

      throwErroIfHasInRequest(data);

      return HttpResponse(
        data: data,
      );
    } on DioException catch (exception) {
      throw HttpException(
        exception.message ?? 'Ops! Algo deu errado.',
        stackTrace: exception.stackTrace,
      );
    }
  }
}
