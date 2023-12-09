import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  RxBool isDark = false.obs;

  final box = GetStorage('app_storage');

  @override
  void onInit() {
    String? theme = box.read('theme');

    if (theme == null) {
      var brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    } else if (theme == ThemeMode.light.toString()) {
      _themeMode = ThemeMode.light;
    } else if (theme == ThemeMode.dark.toString()) {
      _themeMode = ThemeMode.dark;
    }
    isDark.value = _themeMode == ThemeMode.dark;
    setTheme(_themeMode);
    super.onInit();
  }

  setTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    isDark.value = _themeMode == ThemeMode.dark;
    box.write('theme', themeMode.toString());
    Get.changeThemeMode(_themeMode);
    // update();
  }
}
