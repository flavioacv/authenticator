import 'package:authenticator/app/core/services/http_service/dio/http_client_dio_service_impl.dart';
import 'package:authenticator/app/core/services/http_service/http_client_service.dart';
import 'package:authenticator/app/core/services/local_storage/local_storage_service.dart';
import 'package:authenticator/app/core/services/local_storage/local_storage_service_impl.dart';
import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'http://localhost:8080/',
        ),
      ),
    );

    i.add<SharedPreferences>(
      () async => await SharedPreferences.getInstance(),
    );
    i.add<LocalStorageService>(LocalStorageServiceImpl.new);

    i.add<HttpClientService>(HttpClientDioServiceImpl.new);
  }
}
