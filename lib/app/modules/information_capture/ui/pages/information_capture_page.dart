import 'package:authenticator/app/core/navigation/navigation_service.dart';
import 'package:authenticator/app/core/services/launch/launch_service.dart';
import 'package:authenticator/app/core/themes/extensions/color_theme_extension.dart';
import 'package:authenticator/app/core/themes/extensions/responsive_extension.dart';

import 'package:authenticator/app/core/widgets/text_widget.dart';
import 'package:authenticator/app/modules/information_capture/interactor/controllers/information_capture_mobx.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InformationCapturePage extends StatefulWidget {
  final InformationCaptureMobx informationCaptureMobx;
  final LaunchService launchService;

  const InformationCapturePage({
    super.key,
    required this.informationCaptureMobx,
    required this.launchService,
  });

  @override
  State<InformationCapturePage> createState() => _InformationCapturePageState();
}

class _InformationCapturePageState extends State<InformationCapturePage> {
  final passwordTextEditingController = TextEditingController();
  final userTextEditingController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final padding = context.padding;
    final colors = context.appColors;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: TextWidget(
                'Deseja sair do app?',
                align: TextAlign.center,
                fontSize: 20.p,
                fontWeight: FontWeight.bold,
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    NavigationService.navigate(
                      context: context,
                      route: '/',
                      arguments: {},
                    );
                  },
                  child: TextWidget(
                    'Sim',
                    colorText: context.appColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: TextWidget(
                    'Não',
                    colorText: context.appColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Observer(builder: (context) {
          final state = widget.informationCaptureMobx.state;
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colors.darkGreen,
                colors.greenLight,
              ],
            )),
            height: screenSize.height,
            width: screenSize.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 33.w,
              ),
              child: SingleChildScrollView(
                padding: padding,
                child: SizedBox(
                  height: screenSize.height - (padding.bottom + padding.top),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 24.0.h,
                        ),
                        child: TextButton(
                          onPressed: () {
                            widget.launchService
                                .launchWeb(url: 'http://www.google.com.br');
                          },
                          child: TextWidget(
                            'Política de privacidade',
                            colorText: context.appColors.white,
                            fontSize: 18.p,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
