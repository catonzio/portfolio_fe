import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/app/shared/controllers/pages_controller.dart';
import 'package:portfolio/app/shared/utils.dart';
import 'package:portfolio/config/text_styles.dart';

class NavbarButtonDesktop extends StatelessWidget {
  const NavbarButtonDesktop({
    super.key,
    required this.controller,
    required this.text,
    required this.index,
  });

  final PagesController controller;
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => InkWell(
              hoverColor: Colors.transparent,
              onTap: () => changePage(context, controller, null, null, index),
              onHover: (value) => controller.setHovering(index, value),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyles.appBarSection,
                  )
                      // style: context.textTheme.titleLarge
                      //     ?.copyWith(fontWeight: FontWeight.bold))
                      .animate(
                        target: controller.isHovering[index] ||
                                controller.currentIndex == index
                            ? 0.5
                            : 1,
                      )
                      .fade(
                        duration: Constants.navbarTransitionDuration,
                      ),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Divider(
                      color: context.textTheme.titleLarge?.color,
                    )
                        .animate(
                          target: controller.isHovering[index] ? 1 : 0,
                        )
                        .fade(duration: Constants.navbarTransitionDuration)
                        .scaleX(
                            begin: 0,
                            end: 1,
                            duration: Constants.navbarTransitionDuration),
                  )
                ],
              ))),
        ),
      ),
    );
  }
}
