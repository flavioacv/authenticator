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
  final List<String>? list;
  final AppException? appException;

  InformationCaptureState.initial()
      : this(status: InformationCaptureStateStatus.initial, list: []);

  InformationCaptureState({
    required this.status,
    this.appException,
    this.list,
  });

  InformationCaptureState copyWith({
    InformationCaptureStateStatus? status,
    AppException? appException,
    List<String>? list,
  }) {
    return InformationCaptureState(
      status: status ?? this.status,
      appException: appException ?? this.appException,
      list: list ?? this.list,
    );
  }
}
