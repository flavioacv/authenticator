import 'package:authenticator/app/core/exception/app_exception.dart';
import 'package:authenticator/app/modules/sign_in/interactor/models/sign_in_model.dart';

enum InformationCaptureStateStatus {
  initial,
  error,
  loading,
  sucess,
}

class InformationCaptureState {
  final InformationCaptureStateStatus status;
  final SignInModel? signInModel;
  final AppException? appException;

  InformationCaptureState.initial()
      : this(
            status: InformationCaptureStateStatus.initial,
            signInModel: SignInModel.empty());

  InformationCaptureState({
    required this.status,
    this.appException,
    this.signInModel,
  });

  InformationCaptureState copyWith({
    InformationCaptureStateStatus? status,
    AppException? appException,
    SignInModel? signInModel,
  }) {
    return InformationCaptureState(
      status: status ?? this.status,
      appException: appException ?? this.appException,
      signInModel: signInModel ?? this.signInModel,
    );
  }
}
