import 'package:dcatone/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dcatone/configs/core_theme.dart' as theme;

import 'controllers/app_controller.dart';

void main() async {
  await GetStorage.init('app_storage');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.put(AppController());
    return GetMaterialApp(
      title: 'Danilo Catone',
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      themeMode: appController.themeMode,
      initialRoute: "/",
      home: MainView(),
    );
  }
}
