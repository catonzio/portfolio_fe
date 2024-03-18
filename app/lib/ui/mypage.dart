import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/pages.dart';
import 'package:portfolio/config/routes.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

void changePage(BuildContext context, PagesController controller, dynamic event,
    void Function()? onChangePage, int? newIndex) {
  if (!controller.isAnimating) {
    if (newIndex == null && event != null) {
      newIndex = controller.onChange(event);
    }
    if (newIndex == controller.currentIndex) return;
    if (onChangePage != null) {
      print("Calling onChangePage");
      onChangePage();
    }
    // controller.currentIndex = newIndex;
    controller.isAnimating = true;

    Future.delayed(Constants.pageTransitionDuration, () {
      controller.isAnimating = false;
      controller.changePage(newIndex!);
    });

    Navigator.of(context).pushReplacementNamed(Routes.all[newIndex!]);
  }
}

class MyOverlay extends StatelessWidget {
  const MyOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      height: context.height * 0.2,
      width: context.width,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (var i = 0; i < Pages.pages.length; i++)
                NavButton(index: i, text: Routes.all[i])
            ],
          ),
        ),
      ),
    );
  }

  // Future<Object?> changePage(BuildContext context, int pageNum) =>
  //     Navigator.of(context).pushReplacementNamed(Routes.all[pageNum]);
}

class NavButton extends StatelessWidget {
  final int index;
  final String text;

  const NavButton({
    super.key,
    required this.index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final PagesController controller = PagesController.to;
    final BorderRadius borderRadius = BorderRadius.circular(10);

    return Container(
      height: context.height * 0.1 * 1,
      width: context.width * 0.1,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              type: MaterialType.button,
              child: InkWell(
                onTap: () => changePage(context, controller, null, null, index),
                onHover: (bool val) => controller.isHovering[index] = val,
                borderRadius: borderRadius,
                child: Text(text, style: context.textTheme.headlineSmall),
              ),
            ),
            Obx(() {
              return const Divider(
                thickness: 2,
                height: 10,
                color: Colors.white,
              )
                  .animate(
                    target: controller.isHovering[index] ||
                            controller.currentIndex == index
                        ? 1
                        : 0,
                  )
                  .fade(duration: 400.ms)
                  .scaleX(begin: 0, end: 1, duration: 400.ms);
            })
          ],
        ),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final Widget body;
  final bool Function(Offset scrollOffset) isScrollEnabled;
  final void Function()? onChangePage;

  const MyPage(
      {super.key,
      required this.body,
      required this.isScrollEnabled,
      this.onChangePage});

  /// onVerticalDragEnd: (details) {
  ///        if (!controller.isAnimating) {
  ///          changePage(context, controller, details);
  ///        }
  ///      },
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
