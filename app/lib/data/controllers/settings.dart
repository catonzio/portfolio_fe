import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxBool _isDark = false.obs;
  get isDark => _isDark.value;
  set isDark(value) => _isDark.value = value;

  @override
  void onInit() {
    isDark = true; // Get.isDarkMode;
    super.onInit();
  }

  void changeTheme() {
    isDark = !isDark;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
