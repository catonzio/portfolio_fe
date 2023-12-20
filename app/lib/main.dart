import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/pages.dart';
import 'package:portfolio/config/routes.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/data/bindings/initial_binding.dart';

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
      theme: Themes.lightTheme(),
      darkTheme: Themes.darkTheme(),
      initialBinding: InitialBindings(),
      initialRoute: Routes.main,
      getPages: AppPages.pages,
    );
  }
}
