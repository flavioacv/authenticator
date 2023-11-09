import 'package:authenticator/app/core/themes/extensions/color_theme_extension.dart';
import 'package:authenticator/app/core/themes/extensions/responsive_extension.dart';
import 'package:authenticator/app/core/types/type.dart';
import 'package:authenticator/app/core/value_objects/user.dart';
import 'package:authenticator/app/core/widgets/button_widget.dart';
import 'package:authenticator/app/core/widgets/loading_widget.dart';
import 'package:authenticator/app/core/widgets/text_field_widget.dart';
import 'package:authenticator/app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/value_objects/password.dart';

class SignInCardWidget extends StatelessWidget {
  final OnChanged<String> onUserChanged;
  final OnChanged<String> onPasswordChanged;
  final VoidCallback? onEnterPressed;
  final bool isLoading;
  final TextEditingController userTextEditingController;
  final TextEditingController passwordTextEditingController;

  const SignInCardWidget({
    super.key,
    required this.onUserChanged,
    required this.onPasswordChanged,
    required this.onEnterPressed,
    required this.isLoading,
    required this.userTextEditingController,
    required this.passwordTextEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.decelerate,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child!,
        );
      },
      child: AspectRatio(
        aspectRatio: 363 / 381,
        child: Container(
          width: context.screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.0.w,
                      ),
                      child: TextFieldWidget(
                        textAlign: TextAlign.start,
                        controller: userTextEditingController,
                        label: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextWidget(
                            'Usuário',
                            fontSize: 20.p,
                            colorText: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onChanged: onUserChanged,
                        validator: (value) {
                          return User(value!).isValidUser;
                        },
                        prefixIcon: Icon(
                          Icons.person_2_rounded,
                          size: 21.w,
                          color: context.appColors.black,
                        ),
                      ),
                    ),
                    TextFieldWidget(
                      textAlign: TextAlign.start,
                      controller: passwordTextEditingController,
                      osbscureText: true,
                      label: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextWidget(
                          'Senha',
                          fontSize: 21.p,
                          colorText: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 21.w,
                        color: context.appColors.black,
                      ),
                      onChanged: onPasswordChanged,
                      validator: (value) {
                        return Password(value!).isValidPassword;
                      },
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                onPressed: onEnterPressed,
                outlinedBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0.w),
                  ),
                ),
                width: context.screenSize.width * 0.5,
                height: 60.h,
                child: Visibility(
                  visible: isLoading,
                  replacement: TextWidget(
                    'Entrar',
                    fontSize: 20.p,
                    fontWeight: FontWeight.w400,
                    colorText: context.appColors.white,
                  ),
                  child: const LoadingWidget(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
