import 'package:dcatone/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/app_theme.dart';
import '../../configs/app_typography.dart';
import '../../controllers/drawer_controller.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/space.dart';
import '../../info/navbar_info.dart';
import '../../widgets/navbar_action_button.dart';
import '../../widgets/navbar_logo.dart';

class NavbarDesktop extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(),
      color: appController.isDark.value ? Colors.black : Colors.white,
      child: Row(children: [
        const NavbarLogo(),
        Space.xm!,
        ...NavbarInfo.names.asMap().entries.map(
              (e) => NavbarActionButton(
                label: e.value,
                index: e.key,
              ),
            ),
        MaterialButton(
          hoverColor: AppTheme.c!.primary!.withAlpha(150),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: AppTheme.c!.primary!,
            ),
          ),
          onPressed: () {
            // html.window.open(
            //   StaticUtils.resume,
            //   "pdf",
            // );
          },
          child: Padding(
            padding: Space.all(1.25, 0.45),
            child: Text(
              'RESUME',
              style: AppText.l1b,
            ),
          ),
        ),
        Obx(() => Switch(
              inactiveTrackColor: Colors.grey,
              value: appController.isDark.value,
              onChanged: (value) {
                appController.setTheme(
                  !value ? ThemeMode.light : ThemeMode.dark,
                );
              },
              activeColor: AppTheme.c!.primary!,
            )),
        Space.x!,
      ]),
    );
  }
}

class NavbarTablet extends StatelessWidget {
  const NavbarTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.v!,
      child: Row(
        children: [
          Space.x1!,
          IconButton(
            highlightColor: Colors.white54,
            splashRadius: AppDimensions.normalize(10),
            onPressed: () {
              Get.find<MyDrawerController>().key.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          Space.xm!,
          const NavbarLogo(),
          Space.x1!,
        ],
      ),
    );
  }
}
