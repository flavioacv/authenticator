// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:authenticator/app/modules/information_capture/interactor/state/information_capture_state.dart';
import 'package:mobx/mobx.dart';

import 'package:authenticator/app/modules/information_capture/data/services/information_capture_service.dart';

part 'information_capture_mobx.g.dart';

class InformationCaptureMobx = _InformationCaptureMobxBase
    with _$InformationCaptureMobx;

abstract class _InformationCaptureMobxBase with Store {
  final InformationCaptureService informationCaptureService;

  _InformationCaptureMobxBase({
    required this.informationCaptureService,
  });

  @observable
  InformationCaptureState state = InformationCaptureState.initial();
}
