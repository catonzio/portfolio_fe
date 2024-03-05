import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/bindings/spaceship_bindings.dart';
import 'package:portfolio/ui/pages/spaceship_page.dart';
// import 'package:portfolio/trials/home_view.dart';

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
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      initialBinding: SpaceshipBindings(),
      home: const SpaceshipPage(),
    );
  }
}
