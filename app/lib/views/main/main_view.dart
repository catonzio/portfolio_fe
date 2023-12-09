import 'package:dcatone/configs/app.dart';
import 'package:dcatone/controllers/app_controller.dart';
import 'package:dcatone/views/main/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/drawer_controller.dart';
import '../responsive.dart';
import 'mobile_drawer.dart';
import 'navbar_desktop.dart';

class MainView extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  final MyDrawerController myDrawerController = Get.put(MyDrawerController());
  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
        key: myDrawerController.key,
        extendBodyBehindAppBar: true,
        drawer: !Responsive.isDesktop(context) ? MobileDrawer() : null,
        backgroundColor:
            appController.isDark.value ? Colors.black : Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Body(),
              // const ArrowOnTop(),
              Responsive.isTablet(context) || Responsive.isMobile(context)
                  ? const NavbarTablet()
                  : NavbarDesktop(),
            ],
          ),
        ));
  }
}
