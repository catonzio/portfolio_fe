import 'dart:math';

import 'package:get/get.dart';
import 'package:portfolio/app/extensions/context_ext.dart';
import 'package:portfolio/app/shared/controllers/pages_controller.dart';
import 'package:portfolio/app/shared/ui/navbar/desktop/navbar_desktop.dart';
import 'package:portfolio/app/shared/ui/navbar/mobile/navbar_mobile.dart';
import 'package:portfolio/app/shared/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final Widget body;
  final bool Function(Offset scrollOffset) isScrollEnabled;
  final void Function()? onChangePage;

  const MyPage(
      {super.key,
      required this.body,
      required this.isScrollEnabled,
      this.onChangePage});

  @override
  Widget build(BuildContext context) {
    final PagesController controller = PagesController.to;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: context.isMobile
          ? null
          : const NavbarDesktop(), // AppBar().animate(target: context.isMobile ? 0 : 1).fade(),
      bottomNavigationBar: context.isMobile ? const NavbarMobile() : null,
      backgroundColor: context.theme.colorScheme.surface,
      body: Listener(
          onPointerSignal: (event) {
            if (event is PointerScrollEvent &&
                !controller.isAnimating &&
                (event.scrollDelta.direction == pi / 2 ||
                    event.scrollDelta.direction == -pi / 2) &&
                isScrollEnabled(event.scrollDelta)) {
              changePage(
                  context, controller, event.scrollDelta, onChangePage, null);
            }
          },
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (!controller.isAnimating) {
                changePage(context, controller, details, onChangePage, null);
              }
            },
            child: body,
          )),
    );
  }
}
