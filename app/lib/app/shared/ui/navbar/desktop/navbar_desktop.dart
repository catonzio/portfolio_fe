import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/routes/app_pages.dart';
import 'package:portfolio/app/shared/controllers/pages_controller.dart';
import 'package:portfolio/app/shared/ui/navbar/desktop/navbar_button_desktop.dart';
import 'package:portfolio/app/shared/utils.dart';

class NavbarDesktop extends StatelessWidget implements PreferredSizeWidget {
  const NavbarDesktop({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.7);

  @override
  Widget build(BuildContext context) {
    final PagesController controller = PagesController.to;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.theme.colorScheme.surface.withOpacity(0.9),
      scrolledUnderElevation: 0,
      title: Container(
          width: context.width * 0.25,
          alignment: Alignment.centerRight,
          child: TitleWidget(controller: controller)),
      toolbarHeight: preferredSize.height,
      actions: [
        for (int i = 0; i < Routes.navbar.length; i++)
          NavbarButtonDesktop(
            controller: controller,
            text: Routes.navbar[i].replaceAll("/", "").toUpperCase(),
            index: i + 1,
          ),
        SizedBox(
          width: context.width * 0.1,
        )
      ],
    ); //.animate(target: context.isMobile ? 0 : 1).fade(duration: 1000.ms);
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.controller,
  });

  final PagesController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () => changePage(context, controller, Offset.zero, null, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logos/logo.png",
                width: 50,
              ),
              Text(
                "Portfolio",
                style: context.textTheme.headlineLarge,
              ),
            ],
          )),
    );
  }
}
