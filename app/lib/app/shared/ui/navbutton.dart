import 'package:portfolio/config/constants.dart';
import 'package:portfolio/app/shared/controllers/pages_controller.dart';
import 'package:portfolio/app/shared/utils.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class NavButton extends StatelessWidget {
  final int index;
  final String text;
  final double width;
  final double height;

  const NavButton({
    super.key,
    required this.index,
    required this.text,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final PagesController controller = PagesController.to;
    final BorderRadius borderRadius = BorderRadius.circular(10);

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              type: MaterialType.button,
              child: InkWell(
                onTap: () => changePage(context, controller, Offset.zero, null, index),
                onHover: (bool val) => controller.isHovering[index] = val,
                borderRadius: borderRadius,
                child: AutoSizeText(text,
                    maxLines: 1, style: context.textTheme.headlineSmall),
              ),
            ),
            Obx(() {
              return Divider(
                thickness: 2,
                height: height * 0.1,
                color: Colors.white,
              )
                  .animate(
                    target: controller.isHovering[index] ||
                            controller.currentIndex == index
                        ? 1
                        : 0,
                  )
                  .fade(duration: Constants.navbarTransitionDuration)
                  .scaleX(
                      begin: 0,
                      end: 1,
                      duration: Constants.navbarTransitionDuration);
            })
          ],
        ),
      ),
    );
  }
}
