import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/pages.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

class MyPage extends StatelessWidget {
  final Widget body;
  const MyPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final PagesController controller = PagesController.to;
    return Scaffold(
      body: Listener(
        onPointerSignal: (event) => changePage2(context, controller, (event as PointerScrollEvent).scrollDelta),
        // controller.onScrollEvent(
        //     (event as PointerScrollEvent).scrollDelta, changePage),
        child: GestureDetector(
            onVerticalDragEnd: (details) =>
                changePage2(context, controller, details),
            // controller.onVerticalDragEnd(details, changePage),
            child: body),
      ),
    );
  }

  Future<Object?> changePage2(
          BuildContext context, PagesController controller, dynamic event) =>
      Navigator.of(context)
          .pushNamed(Pages.pages.keys.toList()[controller.onChange(event)]);
}
