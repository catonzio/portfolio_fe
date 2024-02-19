import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';
// import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/data/controllers/home_controller.dart';
import 'package:portfolio/data/models/section.dart';
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
              width: context.width,
              decoration: BoxDecoration(
                image: imagePath.isEmpty
                    ? null
                    : DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.fill),
              ),
              child: Container(
                width: context.width,
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
    final HomeController controller = HomeController.to;
    final List<Section> sections = Configs.sectionsInfo.values.toList();
    final List<GlobalKey> sectionKeys = controller.sectionKeys.values.toList();
    return CustomScrollView(
      physics: const ScrollPhysics(),
      controller: controller.scrollController,
      slivers: [
        if (context.isDesktop)
          const SliverAppBar(
            pinned: true,
            floating: true,
            snap: false,
            flexibleSpace: NavbarDesktop(),
          ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
              List.generate(sections.length, (index) {
            Section section = sections[index];
            return SizedBox(
              key: sectionKeys[index],
              height: context.pageHeight(perc: section.heightPerc),
              child: section.instantiatePage(),
            );
          })),
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
