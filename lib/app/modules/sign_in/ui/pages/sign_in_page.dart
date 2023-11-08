import 'package:authenticator/app/core/navigation/navigation_service.dart';
import 'package:authenticator/app/core/themes/extensions/color_theme_extension.dart';
import 'package:authenticator/app/core/themes/extensions/responsive_extension.dart';
import 'package:authenticator/app/core/value_objects/password.dart';
import 'package:authenticator/app/core/widgets/text_widget.dart';
import 'package:authenticator/app/modules/sign_in/interactor/controllers/sign_in_mobx.dart';
import 'package:authenticator/app/modules/sign_in/interactor/state/sign_in_state.dart';
import 'package:authenticator/app/modules/sign_in/ui/widgets/sign_in_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignInPage extends StatefulWidget {
  final SignInMobx signInController;

  const SignInPage({
    super.key,
    required this.signInController,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final passwordTextEditingController = TextEditingController();
  final userTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final padding = context.padding;
    final colors = context.appColors;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Observer(builder: (context) {
        final state = widget.signInController.state;
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
                    const Spacer(),
                    const Spacer(),
                    SignInCardWidget(
                      passwordTextEditingController:
                          passwordTextEditingController,
                      userTextEditingController: userTextEditingController,
                      onUserChanged: (value) =>
                          widget.signInController.setEmail(value),
                      onPasswordChanged: (value) =>
                          widget.signInController.setPassword(Password(value)),
                      isLoading: state.status == SignInStateStatus.loading,
                      onEnterPressed: widget.signInController.doSignIn,
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 24.0.h,
                      ),
                      child: TextButton(
                        onPressed: () {
                          // NavigationService.navigate(
                          //   context: context,
                          //   route: '/forgot_password/',
                          // );
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
    );
  }
}
