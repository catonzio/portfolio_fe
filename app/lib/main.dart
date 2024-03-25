import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/app//shared/bindings/initial_binding.dart';
import 'package:portfolio/app/shared/controllers/pages_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Portfolio",
      theme: Themes.lightTheme(),
      themeMode: ThemeMode.light,
      initialBinding: InitialBinding(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      routingCallback: (value) =>
          PagesController.to.changePage(Routes.all.indexOf(value!.current)),
    );
  }
}
