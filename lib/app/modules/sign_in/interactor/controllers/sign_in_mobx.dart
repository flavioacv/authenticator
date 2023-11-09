import 'package:authenticator/app/core/navigation/navigation_service.dart';
import 'package:authenticator/app/core/services/snack_bar/snack_bar.dart';
import 'package:authenticator/app/core/value_objects/password.dart';
import 'package:authenticator/app/core/value_objects/user.dart';
import 'package:authenticator/app/modules/sign_in/data/services/sign_in_service.dart';
import 'package:authenticator/app/modules/sign_in/interactor/models/sign_in_model.dart';

import 'package:authenticator/app/modules/sign_in/interactor/state/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_mobx.g.dart';

class SignInMobx = _SignInMobxBase with _$SignInMobx;

abstract class _SignInMobxBase with Store {
  final SignInService signInService;

  _SignInMobxBase(this.signInService);

  @observable
  SignInState state = SignInState.initial();

  @observable
  SignInModel signInModel = SignInModel.empty();

  @action
  void setUser(User user) {
    signInModel = signInModel.copyWith(
      user: user,
    );
  }

  @action
  void setPassword(Password password) {
    signInModel = signInModel.copyWith(
      password: password,
    );
  }

  Future<void> doSignIn() async {
    state = state.copyWith(status: SignInStateStatus.loading);

    final stateRes = await signInService.doSignIn(signInModel);
    await Future.delayed(const Duration(seconds: 3));

    state = stateRes;
  }

  Future<void> addListener(BuildContext context) async {
    reaction((_) => state.status, (status) {
      if (status == SignInStateStatus.error) {
        SnackBarService.showError(
          context: context,
          message: state.appException!.message,
        );
      }
      if (status == SignInStateStatus.sucess) {
        NavigationService.navigate(
          context: context,
          route: '/information-capture',
          arguments: {},
        );
      }
    });
  }
}
