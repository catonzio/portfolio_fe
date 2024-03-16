import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/pages.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

class MyOverlay extends StatelessWidget {
  const MyOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      height: context.height * 0.1,
      width: context.width,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < Pages.pages.length; i++)
              ElevatedButton(
                onPressed: () => changePage(context, i),
                child: Center(
                  child: Text(
                    Pages.pages.keys.toList()[i],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<Object?> changePage(BuildContext context, int pageNum) =>
      Navigator.of(context).pushNamed(Pages.pages.keys.toList()[pageNum]);
}

class MyPage extends StatelessWidget {
  final Widget body;
  final bool Function() isScrollEnabled;
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
      body: GestureDetector(
          onVerticalDragEnd: (details) {
            print("Drag is animating: ${controller.isAnimating}");
            !controller.isAnimating
                ? changePage(context, controller, details)
                : print("Not a drag event");
          },
          child: Listener(
              onPointerSignal: (event) {
                print("Scroll is animating: ${controller.isAnimating}");
                event is PointerScrollEvent &&
                        !controller.isAnimating &&
                        isScrollEnabled()
                    ? changePage(context, controller, event.scrollDelta)
                    : print("Not a scroll event");
              },
              child: body)),
    );
  }

  void changePage(
      BuildContext context, PagesController controller, dynamic event) {
    if (!controller.isAnimating) {
      int newIndex = controller.onChange(event);
      if (newIndex == controller.currentIndex) return;
      if (onChangePage != null) {
        print("Calling onChangePage");
        onChangePage!();
      }
      Navigator.of(context).pushNamed(Pages.pages.keys.toList()[newIndex]);
    }
  }
}
