import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';
// import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/data/controllers/home_controller.dart';
import 'package:portfolio/data/controllers/section_controller.dart';
import 'package:portfolio/widgets/navbar/navbar_desktop.dart';
import 'package:portfolio/widgets/navbar/navbar_mobile.dart';
import 'package:portfolio/widgets/return_up_button.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: (context.isMobile || context.isTabletMine)
              ? const NavbarMobile()
              : null,
          body: Stack(
            children: getBackgroundImages(context, controller) +
                getSections(context, controller.scrollController),
          ),
          floatingActionButton:
              (controller.currentOffset >= controller.returnUpOffset()) &&
                      controller.currentOffset != 0
                  ? ReturnUpButton(onPressed: controller.returnUp)
                  : null,
        );
      },
    );
  }

  List<Widget> getBackgroundImages(
      BuildContext context, HomeController controller) {
    double height = context.pageHeight();

    return [
      Obx(() {
        String imagePath =
            Configs.sectionsInfo[controller.currentBgSection]!.imagePath;
        Color bgColor =
            Configs.sectionsInfo[controller.currentBgSection]!.bgColor;

        return Positioned(
            left: 0,
            right: 0,
            top: context.navbarHeight,
            height: height,
            child: Container(
              decoration: BoxDecoration(
                  image: imagePath.isEmpty
                      ? null
                      : DecorationImage(
                          image: AssetImage(imagePath), fit: BoxFit.cover)),
              child: Container(
                  decoration: BoxDecoration(
                      color: bgColor,
                      gradient: RadialGradient(
                          center: AlignmentDirectional.topEnd,
                          radius: 1.5,
                          colors: [
                            bgColor.withOpacity(0),
                            bgColor.withOpacity(0.25),
                            bgColor.withOpacity(0.50),
                            bgColor.withOpacity(0.5),
                            bgColor.withOpacity(0.75),
                          ],
                          stops: const [
                            0.0,
                            0.25,
                            0.5,
                            0.75,
                            1
                          ])),
                  child: Container(
                    color: bgColor.withOpacity(0),
                  )),
            ));
      }),
    ];
  }

  List<Widget> getSections(BuildContext context, ScrollController controller) {
    // height -= height * 0.1;
    return [
      CustomScrollView(
        physics: const ScrollPhysics(),
        controller: controller,
        slivers: [
          if (context.isDesktop)
            const SliverAppBar(
              pinned: true,
              floating: true,
              snap: false,
              flexibleSpace: NavbarDesktop(),
            ),
          SliverList(
            delegate: SliverChildListDelegate(
              Configs.sectionsInfo.values.map((e) {
                // Get.put(SectionController.fromMap(e), tag: e.title);
                return SizedBox(
                  width: context.width,
                  height: context.pageHeight(perc: e.heightPerc),
                  child: e.page(e.title),
                );
              }).toList(),
            ),
          )
        ],
      )
    ];
  }
}
