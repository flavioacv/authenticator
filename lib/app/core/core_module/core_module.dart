import 'package:authenticator/app/core/services/http_service/dio/http_client_dio_service_impl.dart';
import 'package:authenticator/app/core/services/http_service/http_client_service.dart';
import 'package:authenticator/app/core/services/local_storage/local_storage_service.dart';
import 'package:authenticator/app/core/services/local_storage/local_storage_service_impl.dart';
import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'http://192.168.3.22:8080/',
        ),
      ),
    );

    i.add<LocalStorageService>(LocalStorageServiceImpl.new);

    i.add<HttpClientService>(HttpClientDioServiceImpl.new);
  }
}
