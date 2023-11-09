import 'package:authenticator/app/core/navigation/navigation_service.dart';
import 'package:authenticator/app/core/services/launch/launch_service.dart';
import 'package:authenticator/app/core/themes/extensions/color_theme_extension.dart';
import 'package:authenticator/app/core/themes/extensions/responsive_extension.dart';
import 'package:authenticator/app/core/widgets/shimmer_loading_widget.dart';
import 'package:authenticator/app/core/widgets/text_field_widget.dart';

import 'package:authenticator/app/core/widgets/text_widget.dart';
import 'package:authenticator/app/modules/information_capture/interactor/controllers/information_capture_mobx.dart';
import 'package:authenticator/app/modules/information_capture/interactor/state/information_capture_state.dart';
import 'package:authenticator/app/modules/information_capture/ui/widgets/central_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InformationCapturePage extends StatefulWidget {
  final InformationCaptureMobx informationCaptureController;
  final LaunchService launchService;

  const InformationCapturePage({
    super.key,
    required this.informationCaptureController,
    required this.launchService,
  });

  @override
  State<InformationCapturePage> createState() => _InformationCapturePageState();
}

class _InformationCapturePageState extends State<InformationCapturePage> {
  var focusNode = FocusNode();
  final inputTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    widget.informationCaptureController.addListener(context);
    widget.informationCaptureController.getListStart();
  }

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
          final state = widget.informationCaptureController.state;

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
                      Column(
                        children: [
                          ShimmerLoadingWidget(
                            itemShimmer: 1,
                            heigthShimmer: 363,
                            showShimmer: state.status ==
                                InformationCaptureStateStatus.loading,
                            padding: EdgeInsets.symmetric(
                              horizontal: 33.w,
                            ),
                            child: CentralCardWidget(
                              list: widget
                                  .informationCaptureController.listString,
                              onRemove: (value) async {
                                widget.informationCaptureController
                                    .removeItem(value);
                                await widget.informationCaptureController
                                    .saveList();
                                Navigator.pop(context, true);
                              },
                              onEdit: (value, index) {
                                widget.informationCaptureController
                                    .setEdit(isEdit: true, index: index);
                                inputTextController.text = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFieldWidget(
                        focusNode: focusNode,
                        onFieldSubmitted: (value) async {
                          if (inputTextController.text.isNotEmpty) {
                            if (widget
                                .informationCaptureController.edition.isEdit) {
                              widget.informationCaptureController.editItem(
                                  value,
                                  widget.informationCaptureController.edition
                                      .index!);
                              await widget.informationCaptureController
                                  .saveList();
                              widget.informationCaptureController
                                  .setEdit(isEdit: false, index: null);
                              focusNode.requestFocus();
                              inputTextController.text = '';
                            } else {
                              widget.informationCaptureController
                                  .addItem(value);
                              await widget.informationCaptureController
                                  .saveList();
                              focusNode.requestFocus();
                              inputTextController.text = '';
                            }
                          } else {
                            focusNode.requestFocus();
                          }
                        },
                        textInputAction: TextInputAction.go,
                        textAlign: TextAlign.center,
                        autofocus: true,
                        controller: inputTextController,
                        hintText: 'Digite seu texto',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatório';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const Spacer(),
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
