import 'package:dcatone/controllers/app_controller.dart';
import 'package:dcatone/controllers/home_scroll_controller.dart';
import 'package:dcatone/info/navbar_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/app_theme.dart';
import '../../configs/app_typography.dart';
import '../../widgets/navbar_logo.dart';

class MobileDrawer extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor:
            appController.isDark.value ? Colors.grey[900] : Colors.white,
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Column(
              children: [
                const Center(child: NavbarLogo()),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.light_mode, color: AppTheme.c!.primary!),
                  title: const Text("Dark Mode"),
                  trailing: Switch(
                    inactiveTrackColor: Colors.grey,
                    value: appController.isDark.value,
                    onChanged: (value) => appController
                        .setTheme(value ? ThemeMode.dark : ThemeMode.light),
                  ),
                ),
                const Divider(),
                ...NavbarInfo.names.asMap().entries.map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          hoverColor: AppTheme.c!.primary!.withAlpha(70),
                          onPressed: () {
                            Get.find<HomeScrollController>()
                                .scrollMobile(e.key);
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            leading: Icon(
                              NavbarInfo.icons[e.key],
                              color: AppTheme.c!.primary,
                            ),
                            title: Text(
                              e.value,
                              style: AppText.l1,
                            ),
                          ),
                        ),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    hoverColor: AppTheme.c!.primary!.withAlpha(150),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: AppTheme.c!.primary!)),
                    onPressed: () => {}, // openURL(StaticUtils.resume),
                    child: const ListTile(
                      leading: Icon(
                        Icons.book,
                        color: Colors.red,
                      ),
                      title: Text(
                        'RESUME',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
