import 'package:dio/dio.dart';

import '../../local_storage/local_storage_service.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final LocalStorageService _localStorageService;

  AuthInterceptor(this._localStorageService);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Aplicar token de autenticação quando estiver disponível
    final token = await _localStorageService.getString('token');
    options.headers['Authorization'] = "Bearer $token";

    super.onRequest(options, handler);
  }
}
