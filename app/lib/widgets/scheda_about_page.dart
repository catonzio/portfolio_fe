import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/data/controllers/scheda_about_controller.dart';

class SchedaAboutPage extends StatelessWidget {
  final List<String> titles;
  final List<Widget> bodies;
  final double height;
  final double width;

  const SchedaAboutPage(
      {super.key,
      required this.titles,
      required this.bodies,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GetX<SchedaAboutController>(
      builder: (controller) {
        controller.maxCount = bodies.length;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titles[controller.count],
              style: context.textTheme.headlineLarge!
                  .copyWith(color: context.colorScheme.onInverseSurface),
            ),
            const Divider(
              thickness: 2,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: width * 0.02,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          bodies[controller.count],
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: height / 2 - height * 0.1,
                    left: 0,
                    child: IconButton(
                      onPressed: () => controller.decrement(),
                      icon: Icon(Icons.arrow_back,
                          color: context.colorScheme.onInverseSurface),
                    ),
                  ),
                  Positioned(
                    top: height / 2 - height * 0.1,
                    right: 0,
                    child: IconButton(
                      onPressed: () => controller.increment(),
                      icon: Icon(Icons.arrow_forward,
                          color: context.colorScheme.onInverseSurface),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: context.colorScheme.inverseSurface,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < controller.maxCount; i++)
                            GestureDetector(
                              onTap: () => controller.count = i,
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                width: height * 0.015,
                                height: height * 0.015,
                                decoration: BoxDecoration(
                                    color: controller.count == i
                                        ? context.colorScheme.inversePrimary
                                        : context.colorScheme.onInverseSurface
                                            .withOpacity(0.2),
                                    shape: BoxShape.circle),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
