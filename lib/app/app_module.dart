import 'package:authenticator/app/modules/information_capture/information_capture_module.dart';
import 'package:authenticator/app/modules/sign_in/sign_in_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      module: SignInModule(),
    );
    r.module(
      '/information-capture',
      module: InformationCaptureModule(),
    );
  }
}
