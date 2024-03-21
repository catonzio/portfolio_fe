import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app//config/themes.dart';
import 'package:portfolio/app//shared/bindings/initial_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Portfolio",
      theme: Themes.lightTheme(),
      darkTheme: Themes.darkTheme(),
      themeMode: ThemeMode.system,
      initialBinding: InitialBinding(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
