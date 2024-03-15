import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/data/bindings/initial_binding.dart';
import 'package:portfolio/ui/home_page.dart';
import 'package:portfolio/ui/trial_page.dart';

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
      themeMode: ThemeMode.system,
      initialBinding: InitialBinding(),
      home: const TrialPage(),
    );
  }
}
