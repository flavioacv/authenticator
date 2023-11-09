import 'package:authenticator/app/core/core_module/core_module.dart';
import 'package:authenticator/app/core/services/launch/launch_service.dart';
import 'package:authenticator/app/modules/sign_in/interactor/controllers/sign_in_mobx.dart';
import 'package:authenticator/app/modules/sign_in/ui/pages/sign_in_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'data/services/sign_in_service.dart';
import 'data/services/sign_in_service_impl.dart';

class SignInModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) {
      return SignInPage(
        signInController: Modular.get<SignInMobx>(),
        launchService: Modular.get<LaunchService>(),
      );
    });
  }

  @override
  void binds(Injector i) {
    i.addLazySingleton<SignInService>(
      SignInServiceImpl.new,
    );
    i.addLazySingleton<SignInMobx>(
      SignInMobx.new,
    );
  }
}
