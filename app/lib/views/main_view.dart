import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';
// import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/data/controllers/home_controller.dart';
import 'package:portfolio/widgets/navbar/navbar_desktop.dart';
import 'package:portfolio/widgets/navbar/navbar_mobile.dart';
import 'package:portfolio/widgets/return_up_button.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        String imagePath =
            Configs.sectionsInfo[controller.currentBgSection]!.imagePath;
        Color bgColor =
            Configs.sectionsInfo[controller.currentBgSection]!.bgColor;

        return Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                image: imagePath.isEmpty
                    ? null
                    : DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.fitHeight),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: bgColor,
                    gradient: RadialGradient(
                        center: AlignmentDirectional.topEnd,
                        radius: 1.5,
                        colors: [
                          bgColor.withOpacity(0),
                          bgColor.withOpacity(0.5),
                          bgColor.withOpacity(0.75),
                        ],
                        stops: const [
                          0.0,
                          0.5,
                          1
                        ])),
              ),
            ));
      },
    );
  }
}

class HomeSections extends StatelessWidget {
  const HomeSections({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ScrollPhysics(),
      controller: HomeController.to.scrollController,
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
              // Get.put(SectionController.fromMap(e.toMap()), tag: e.title);
              return SizedBox(
                width: context.width,
                height: context.pageHeight(perc: e.heightPerc),
                child: e.instantiatePage(),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

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
          body: const Stack(children: [BackgroundImage(), HomeSections()]),
          floatingActionButton:
              (controller.currentOffset >= controller.returnUpOffset()) &&
                      controller.currentOffset != 0
                  ? ReturnUpButton(onPressed: controller.returnUp)
                  : null,
        );
      },
    );
  }
}
