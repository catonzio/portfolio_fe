import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final AppLifecycleListener _appLifecycleListener;
  final Rx<String> _appLifecycleState =
      AppLifecycleState.resumed.toString().obs;
  String get appLifecycleState => _appLifecycleState.value;
  set appLifecycleState(String state) => _appLifecycleState.value = state;

  @override
  void onInit() {
    super.onInit();
    _appLifecycleListener = AppLifecycleListener(
      onDetach: _onDetach,
      onHide: _onHide,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onResume: _onResume,
      onShow: _onShow,
      onStateChange: _onStateChange,
    );
  }

  @override
  void onClose() {
    _appLifecycleListener.dispose();
    super.onClose();
  }

  void _onDetach() {
    appLifecycleState = AppLifecycleState.detached.toString();
    print("_onDetach");
  }

  void _onHide() {
    appLifecycleState = AppLifecycleState.hidden.toString();
    print("_onHide");
  }

  void _onInactive() {
    appLifecycleState = AppLifecycleState.inactive.toString();
    print("_onInactive");
  }

  void _onPause() {
    appLifecycleState = AppLifecycleState.paused.toString();
    print("_onPause");
  }

  void _onRestart() {
    appLifecycleState = AppLifecycleState.resumed.toString();
    print("_onRestart");
  }

  void _onResume() {
    appLifecycleState = AppLifecycleState.resumed.toString();
    print("_onResume");
  }

  void _onShow() {
    appLifecycleState = "onShow";
    print("_onShow");
  }

  void _onStateChange(AppLifecycleState state) {
    print("_onStateChange");
  }
}
