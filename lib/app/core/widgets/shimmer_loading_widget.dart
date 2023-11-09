
import 'package:authenticator/app/core/themes/extensions/color_theme_extension.dart';
import 'package:authenticator/app/core/themes/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatefulWidget {
  final bool showShimmer;
  final double? widthShimmer;
  final double? heigthShimmer;
  final Widget child;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final int itemShimmer;

  const ShimmerLoadingWidget({
    required this.showShimmer,
    this.heigthShimmer,
    this.widthShimmer,
    required this.child,
    this.radius,
    this.padding,
    this.itemShimmer = 1,
    super.key,
  });

  @override
  State<ShimmerLoadingWidget> createState() => _ShimmerLoadingWidgetState();
}

class _ShimmerLoadingWidgetState extends State<ShimmerLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.showShimmer,
      replacement: widget.child,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.only(top: 10.h),
        child: Column(
          children: List.generate(
            widget.itemShimmer,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 8.0.h),
              child: Shimmer.fromColors(
                enabled: true,
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.appColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? 10.w),
                    ),
                  ),
                  width: widget.widthShimmer ?? context.screenSize.width,
                  height: widget.heigthShimmer ?? 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
