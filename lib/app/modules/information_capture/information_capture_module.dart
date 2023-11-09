import 'package:authenticator/app/core/core_module/core_module.dart';
import 'package:authenticator/app/core/services/launch/launch_service.dart';
import 'package:authenticator/app/modules/information_capture/interactor/controllers/information_capture_mobx.dart';
import 'package:authenticator/app/modules/information_capture/ui/pages/information_capture_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'data/services/information_capture_service.dart';
import 'data/services/information_capture_service_impl.dart';

class InformationCaptureModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) {
      return InformationCapturePage(
        informationCaptureController: Modular.get<InformationCaptureMobx>(),
        launchService: Modular.get<LaunchService>(),
      );
    });
  }

  @override
  void binds(Injector i) {
    i.addLazySingleton<InformationCaptureService>(
      InformationCaptureServiceImpl.new,
    );
    i.addLazySingleton<InformationCaptureMobx>(
      InformationCaptureMobx.new,
    );
  }
}
