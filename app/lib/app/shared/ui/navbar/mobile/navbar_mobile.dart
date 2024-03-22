import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/extensions/context_ext.dart';
import 'package:portfolio/app/routes/app_pages.dart';
import 'package:portfolio/app/shared/controllers/pages_controller.dart';
import 'package:portfolio/app/shared/utils.dart';

class NavbarMobile extends StatelessWidget {
  const NavbarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final PagesController controller = PagesController.to;
    return BottomNavigationBar(
        currentIndex: controller.currentIndex.clamp(0, Routes.numRoutes - 1),
        onTap: (value) => changePage(context, controller, null, null, value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Contact'),
        ]).animate(target: context.isMobile ? 1 : 0).fade(duration: 1000.ms);
  }
}
