import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/data/bindings/initial_bindings.dart';
import 'package:portfolio/ui/home_page.dart';

// Reference sites:
// https://shaq-portfolio.netlify.app/#about
// http://preview.themeforest.net/item/ramsay-personal-cvresume-wordpress-theme/full_screen_preview/26080372?_ga=2.54900265.305267862.1710259304-753787713.1710259304

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.darkTheme(),
      initialBinding: InitialBindings(),
      home: const HomePage(),
    );
  }
}
