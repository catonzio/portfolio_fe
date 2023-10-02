import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/controllers/project_detail_controller.dart';
import 'package:portfolio/controllers/settings.dart';
import 'package:portfolio/views/main_view.dart';
import 'package:portfolio/views/project_detail/project_detail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
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
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/', page: () => const MainView(), binding: HomeBindings()),
        GetPage(
            name: '/project-detail',
            arguments: const {'projectName': ''},
            transition: Transition.downToUp,
            page: () => const ProjectDetailPage(),
            binding: ProjectDetailBindings()),
      ],
    );
  }
}
