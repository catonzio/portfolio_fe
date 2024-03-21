import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/pages.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/data/bindings/initial_binding.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';
// import 'package:portfolio/ui/home_page.dart';
// import 'package:portfolio/ui/trial_page.dart';

import 'config/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(
                  child: Text('Page not found'),
                ),
              )),
      theme: Themes.lightTheme(),
      darkTheme: Themes.darkTheme(),
      themeMode: ThemeMode.system,
      initialBinding: InitialBinding(),
      getPages: Pages.pages.values.toList(),
      onDispose: () => print("App Disposed"),
      onInit: () => print("App Initialized"),
      onReady: () => print("App Ready"),
      routingCallback: (value) =>
          PagesController.to.changePage(Routes.all.indexOf(value!.current)),
      initialRoute: Routes.all[0],
    );
  }
}
