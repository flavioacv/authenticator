
import 'package:authenticator/app/core/services/http_service/http_client_service.dart';
import 'package:authenticator/app/core/services/local_storage/local_storage_service.dart';


import 'information_capture_service.dart';

class InformationCaptureServiceImpl implements InformationCaptureService {
  final HttpClientService _httpClientService;
  final LocalStorageService _localStorageService;

  const InformationCaptureServiceImpl({
    required HttpClientService httpClientService,
    required LocalStorageService localStorageService,
  })  : _httpClientService = httpClientService,
        _localStorageService = localStorageService;

  // @override
  // Future<SignInState> doSignIn(SignInModel signInModel) async {
  //   try {
  //     final response = await _httpClientService.post(
  //       '/auth',
  //       body: signInModel.toMap(),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //     );

  //     await _localStorageService.setString(
  //       'token',
  //       response.data['access_token'] as String,
  //     );

  //     return SignInState(
  //       status: SignInStateStatus.sucess,
  //     );
  //   } on AppException catch (error) {
  //     return SignInState(
  //       status: SignInStateStatus.error,
  //       appException: error,
  //     );
  //   }
  // }
}
