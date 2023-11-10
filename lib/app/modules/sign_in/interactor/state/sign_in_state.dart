import 'package:authenticator/app/core/exception/app_exception.dart';
import 'package:authenticator/app/modules/sign_in/interactor/models/sign_in_model.dart';


enum SignInStateStatus {
  initial,
  error,
  loading,
  sucess,
}

class SignInState {
  final SignInStateStatus status;
  final SignInModel? signInModel;
  final AppException? appException;

  SignInState.initial()
      : this(
            status: SignInStateStatus.initial,
            signInModel: SignInModel.empty());

  SignInState({
    required this.status,
    this.appException,
    this.signInModel,
  });

  SignInState copyWith({
    SignInStateStatus? status,
    AppException? appException,
    SignInModel? signInModel,
  }) {
    return SignInState(
      status: status ?? this.status,
      appException: appException ?? this.appException,
      signInModel: signInModel ?? this.signInModel,
    );
  }
}
