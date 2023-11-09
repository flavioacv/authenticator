import 'dart:convert';

import 'package:authenticator/app/core/exception/app_exception.dart';

import 'package:authenticator/app/core/services/local_storage/local_storage_service.dart';
import 'package:authenticator/app/modules/information_capture/interactor/state/information_capture_state.dart';

import 'information_capture_service.dart';

class InformationCaptureServiceImpl implements InformationCaptureService {
  final LocalStorageService _localStorageService;

  const InformationCaptureServiceImpl({
    required LocalStorageService localStorageService,
  }) : _localStorageService = localStorageService;

  @override
  Future<InformationCaptureState> getList() async {
    try {
      final List<String>? response = await _localStorageService.getListString(
        'list',
      );
      return InformationCaptureState(
        status: InformationCaptureStateStatus.sucess,
        list: response ?? [],
      );
    } on AppException catch (error) {
      return InformationCaptureState(
        status: InformationCaptureStateStatus.error,
        appException: error,
      );
    }
  }

  @override
  Future<InformationCaptureState> saveList(List<String> list) async {
    try {
      await _localStorageService.setListString(
        'list',
        list,
      );
      return InformationCaptureState(
        status: InformationCaptureStateStatus.sucess,
      );
    } on AppException catch (error) {
      return InformationCaptureState(
        status: InformationCaptureStateStatus.error,
        appException: error,
      );
    }
  }

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
