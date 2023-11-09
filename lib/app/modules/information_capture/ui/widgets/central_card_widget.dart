import 'package:authenticator/app/core/themes/extensions/color_theme_extension.dart';
import 'package:authenticator/app/core/themes/extensions/responsive_extension.dart';

import 'package:authenticator/app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CentralCardWidget extends StatefulWidget {
  final List<String> list;
  final void Function(String)? onRemove;
  final void Function(String, int)? onEdit;

  const CentralCardWidget({
    super.key,
    required this.list,
    this.onRemove,
    this.onEdit,
  });

  @override
  State<CentralCardWidget> createState() => _CentralCardWidgetState();
}

class _CentralCardWidgetState extends State<CentralCardWidget> {
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Observer(builder: (context) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 14.0.h,
                            horizontal: 5.0.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                      widget.list[index],
                                      fontSize: 18.p,
                                      fontWeight: FontWeight.bold,
                                      colorText: context.appColors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      widget.onEdit
                                          ?.call(widget.list[index], index);
                                    },
                                    child: Icon(
                                      Icons.border_color,
                                      size: 28.w,
                                      color: context.appColors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await showDialog<bool>(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: TextWidget(
                                              'Deseja excluir o item?',
                                              align: TextAlign.center,
                                              fontSize: 20.p,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            actionsAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  widget.onRemove?.call(
                                                      widget.list[index]);
                                                },
                                                child: TextWidget(
                                                  'Sim',
                                                  colorText:
                                                      context.appColors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context, false);
                                                },
                                                child: TextWidget(
                                                  'Não',
                                                  colorText:
                                                      context.appColors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      size: 30.w,
                                      color: Colors.red.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.p,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    );
                  },
                );
              })),
        ),
      ),
    );
  }
}
