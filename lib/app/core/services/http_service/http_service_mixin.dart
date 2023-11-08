import 'package:authenticator/app/core/services/http_service/http_exception.dart';




mixin HttpServiceMixin {
  void throwErroIfHasInRequest(dynamic data) {
    if (data is Map && data['error'] != null) {
      throw HttpException(
        data['error']['message'],
      );
    }
  }

  // Future<void> throwErrorIfNotConnectionWithInternet(
  //   InternetConnectionService service,
  // ) async {
  //   final hasConnection = await service.checkConnection();

  //   if (!hasConnection) {
  //     throw const HttpException(
  //       'Ops! Algo deu errado. Por favor, verifique sua conexão com a internet e tente novamente.',
  //     );
  //   }
  // }
}
