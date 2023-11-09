// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:authenticator/app/core/services/snack_bar/snack_bar.dart';
import 'package:authenticator/app/modules/information_capture/interactor/state/information_capture_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:authenticator/app/modules/information_capture/data/services/information_capture_service.dart';

part 'information_capture_mobx.g.dart';

class InformationCaptureMobx = _InformationCaptureMobxBase
    with _$InformationCaptureMobx;

abstract class _InformationCaptureMobxBase with Store {
  final InformationCaptureService informationCaptureService;

  _InformationCaptureMobxBase(this.informationCaptureService);

  @observable
  ({bool isEdit, int? index}) edition = (isEdit: false, index: null);

  @observable
  InformationCaptureState state = InformationCaptureState.initial();

  @observable
  ObservableList<String> listString = <String>[].asObservable();

  @action
  void addItem(String data) => listString.add(data);

  @action
  void editItem(String data, int index) => listString[index] = data;

  @action
  void removeItem(String data) => listString.remove(data);

  @action
  void setEdit({required bool isEdit, int? index}) =>
      edition = (index: index, isEdit: isEdit);

  Future<void> getListStart() async {
    state = state.copyWith(status: InformationCaptureStateStatus.loading);
    final stateRes = await informationCaptureService.getList();
    await Future.delayed(const Duration(seconds: 3));
    listString.addAll(stateRes.list ?? []);
    state = stateRes;
  }

  Future<void> saveList() async {
    final stateRes = await informationCaptureService.saveList(listString);
    state = stateRes;
  }

  Future<void> addListener(BuildContext context) async {
    reaction((_) => state.status, (status) {
      if (status == InformationCaptureStateStatus.error) {
        SnackBarService.showError(
          context: context,
          message: state.appException!.message,
        );
      }
    });
  }
}
