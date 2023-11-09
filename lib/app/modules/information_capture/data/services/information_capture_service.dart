

import 'package:authenticator/app/modules/information_capture/interactor/state/information_capture_state.dart';

abstract interface class InformationCaptureService {
  Future<InformationCaptureState> saveList(List<String> list);
  Future<InformationCaptureState> getList();
}
