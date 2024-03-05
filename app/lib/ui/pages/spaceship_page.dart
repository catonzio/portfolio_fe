import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/extensions/double_extension.dart';
import 'package:portfolio/ui/widgets/menu_row.dart';
import 'package:portfolio/data/controllers/scroller.dart';
import 'package:portfolio/ui/widgets/overlays/overlay_1.dart';
import 'package:portfolio/ui/widgets/overlays/overlay_2.dart';
import 'package:portfolio/ui/widgets/shaceship_widget.dart';

class SpaceshipPage extends StatelessWidget {
  const SpaceshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Scroller scroller = Scroller.to;
    final Size size = MediaQuery.of(context).size;
    final String bkgImage = DateTime.now().hour.toDouble().isInBetween(10, 20)
        ? "assets/stars_gradient.png"
        : "assets/stars_sunset.png";
    return Scaffold(
        body: SingleChildScrollView(
            controller: scroller.scrollController,
            child: Container(
              width: size.width.clamp(0, 1920),
              height: Constants.totalHeight,
              alignment: Alignment.center,
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  Obx(() => Positioned(
                        left: 0,
                        bottom: scroller.totalScrollPerc < 0.1
                            ? scroller.scrollOffset * 0.95
                            : Constants.totalHeight * 0.0917,
                        height: Constants.totalHeight,
                        child: Image.asset(
                          bkgImage,
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                  const OverlayWidgets(),
                  const OverlayWidgets2(),
                  const SpaceshipWidget(),
                  const MenuRow(),
                ],
              ),
            )));
  }
}
