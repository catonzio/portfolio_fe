import 'package:flutter/material.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/widgets/navbar/navbar_button_desktop.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    // SettingsController settingsController = Get.find<SettingsController>();
    return Material(
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.widthP(10)),
        child: Row(
          children: [
            TextButton(
              onPressed: () => html.window.location.reload(),
              child: Text(
                "Danilo Catone",
                style: TextStyle(
                    fontSize: 30, color: Themes.colorScheme(context).onSurface),
              ),
            ),
            const Spacer(),
            Row(
                children: Configs.sectionsInfo.keys
                    .map((e) => NavbarButtonDesktop(
                          e,
                        ))
                    .toList()),
            // Obx(() => Transform.scale(
            //       scale: 0.7,
            //       child: Switch(
            //         value: settingsController.isDark,
            //         onChanged: (v) => settingsController.changeTheme(),
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}
