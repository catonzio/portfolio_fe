import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/pages.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

class MyTransition extends CustomTransition {
  final int index;

  MyTransition({required this.index});

  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final PagesController controller = PagesController.to;
    if (controller.currentIndex == index) {
      return child;
    }

    Offset begin;
    Offset end;
    bool isNext;
    Widget oldChild =
        Pages.pages.values.elementAt(controller.currentIndex).page();

    if (controller.currentIndex > index) {
      isNext = false;
      begin = const Offset(0.0, -1.0); // Start from the same position
      end = const Offset(0.0, 0.0); // Slide the new page up from behind
    } else {
      isNext = true;
      begin = const Offset(0.0, 0.0); // Start from the same position
      end = const Offset(0.0, -1.0); // Slide the new page up from behind
    }
    controller.currentIndex = index;
    // const curve = Curves.easeInQuart;
    var tween =
        Tween(begin: begin, end: end); //.chain(CurveTween(curve: curve));

    var offsetAnimation = animation.drive(tween);

    return isNext
        ? Stack(
            children: [
              child,
              SlideTransition(position: offsetAnimation, child: oldChild),
            ],
          )
        : SlideTransition(position: offsetAnimation, child: child);
  }
}
