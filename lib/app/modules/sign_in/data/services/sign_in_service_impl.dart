import 'package:authenticator/app/core/exception/app_exception.dart';
import 'package:authenticator/app/core/services/http_service/http_client_service.dart';
import 'package:authenticator/app/core/services/local_storage/local_storage_service.dart';
import 'package:authenticator/app/modules/sign_in/interactor/models/sign_in_model.dart';
import 'package:authenticator/app/modules/sign_in/interactor/state/sign_in_state.dart';

import 'sign_in_service.dart';

class SignInServiceImpl implements SignInService {
  final HttpClientService _httpClientService;
  final LocalStorageService _localStorageService;

  const SignInServiceImpl({
    required HttpClientService httpClientService,
    required LocalStorageService localStorageService,
  })  : _httpClientService = httpClientService,
        _localStorageService = localStorageService;

  @override
  Future<SignInState> doSignIn(SignInModel signInModel) async {
    try {
      final response = await _httpClientService.post(
        '/auth',
        body: signInModel.toMap(),
      );

      await _localStorageService.setString(
        'token',
        response.data['access_token'] as String,
      );

      return SignInState(
        status: SignInStateStatus.sucess,
      );
    } on AppException catch (error) {
      return SignInState(
        status: SignInStateStatus.error,
        appException: error,
      );
    }
  }
}
