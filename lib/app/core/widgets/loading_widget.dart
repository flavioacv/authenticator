import 'package:authenticator/app/core/themes/extensions/color_theme_extension.dart';
import 'package:authenticator/app/core/themes/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: context.appColors.darkGreen,
      size: 30.0.w,
    );
  }
}
