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
  final bool extendBodyBehindAppBar;
  final bool hasBackButton;

  const MyPage(
      {super.key,
      required this.body,
      required this.isScrollEnabled,
      this.extendBodyBehindAppBar = true,
      this.hasBackButton = false,
      this.onChangePage});

  @override
  Widget build(BuildContext context) {
    final PagesController controller = PagesController.to;
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: context.isMobile
          ? (hasBackButton ? AppBar(leading: const MBackButton()) : null)
          : const NavbarDesktop(), // AppBar().animate(target: context.isMobile ? 0 : 1).fade(),
      bottomNavigationBar: context.isMobile ? const NavbarMobile() : null,
      backgroundColor: context.theme.colorScheme.surface,
      body: GestureDetector(
        onTap: () => print('tap'),
        onHorizontalDragEnd: (details) => print('horizontal drag end'),
        onVerticalDragUpdate: (details) {
          print(details);
        },
        onVerticalDragEnd: (DragEndDetails details) {
          print("Gesture");
          Offset event = -details.velocity.pixelsPerSecond;
          if (!controller.isAnimating && isScrollEnabled(event)) {
            changePage(context, controller, event, onChangePage, null);
          }
        },
        child: Listener(
          onPointerSignal: (event) {
            print("Listener");
            if (event is PointerScrollEvent &&
                !controller.isAnimating &&
                (event.scrollDelta.direction == pi / 2 ||
                    event.scrollDelta.direction == -pi / 2) &&
                isScrollEnabled(event.scrollDelta)) {
              changePage(
                  context, controller, event.scrollDelta, onChangePage, null);
            }
          },
          child: body,
        ),
      ),
    );
  }
}

class MBackButton extends StatelessWidget {
  const MBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(Icons.arrow_back_ios_new),
      padding: const EdgeInsets.all(0),
    );
  }
}
