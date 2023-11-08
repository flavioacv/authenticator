import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/themes/theme_data.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void didChangeDependencies() {
    precacheImage(
      const AssetImage(
        'assets/images/image_background.jpg',
      ),
      context,
    ).then((value) => FlutterNativeSplash.remove());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: Color(0xFF362277),
        systemNavigationBarColor: Color(0xFF362277),
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarDividerColor: Color(0xFF362277),
        systemNavigationBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true,
      ),
    );

    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      theme: themeData,
    );
  }
}
