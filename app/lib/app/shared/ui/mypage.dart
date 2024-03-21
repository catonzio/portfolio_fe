import 'package:app/app/shared/controllers/pages_controller.dart';
import 'package:app/app/shared/ui/myoverlay.dart';
import 'package:app/app/shared/utils.dart';
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
      body: Listener(
          onPointerSignal: (event) {
            if (event is PointerScrollEvent &&
                !controller.isAnimating &&
                isScrollEnabled(event.scrollDelta)) {
              changePage(
                  context, controller, event.scrollDelta, onChangePage, null);
            }
          },
          child: Stack(
            children: [
              body,
              const MyOverlay(),
            ],
          )),
    );
  }
}
