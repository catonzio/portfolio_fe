import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/config/info.dart';
import 'package:portfolio/data/models/section.dart';
import 'package:portfolio/widgets/section_title.dart';

class AboutDesktop extends StatelessWidget {
  final Section section;
  const AboutDesktop(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    double columnWidthPerc = 70;
    double padding = 32;
    return Container(
      // width: context.widthP(100),
      // height: context.pageHeight(perc: 100),
      padding: EdgeInsets.all(padding),
      color: section.bgColor,
      child: Material(
        elevation: 10,
        color: section.bgColor,
        borderRadius: BorderRadius.circular(16),
        child: Swiper(
          itemCount: 2,
          allowImplicitScrolling: true,
          layout: SwiperLayout.DEFAULT,
          controller: SwiperController(),
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            activeColor: context.colorScheme.primary,
            // color: context.colorScheme.secondary,
            size: context.widthP(1.5),
            activeSize: context.widthP(2),
          )),
          itemWidth: context.widthP(50) - padding * 2,
          itemHeight: context.pageHeight(perc: 50) - padding * 2,
          axisDirection: AxisDirection.right,
          control: SwiperControl(
            color: context.colorScheme.surface,
            size: context.widthP(2),
          ),
          containerWidth: context.widthP(70),
          containerHeight: context.pageHeight(perc: 50),
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 2 * padding),
              child: index == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Languages",
                          bottomPadding: 64,
                          baseStyle: context.textTheme.headlineMedium!,
                        ),
                        Expanded(
                          child: ListView(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            shrinkWrap: true,
                            children: buildSkillsWidget(
                                context, columnWidthPerc, padding),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SectionTitle(
                          title: "My History",
                          bottomPadding: 64,
                          baseStyle: context.textTheme.headlineMedium!,
                        ),
                        AutoSizeText(Info.aboutMe,
                            style: context.textTheme.labelMedium!.copyWith(
                                color: context.colorScheme.onInverseSurface))
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   double columnWidthPerc = 40;
  //   double padding = 32;
  //   Get.put(SchedaAboutController());

  //   return GetX<HomeController>(
  //     builder: (controller) {
  //       return Container(
  //         color: section.bgColor,
  //         alignment: Alignment.center,
  //         child: Material(
  //           elevation: 10,
  //           color: context.colorScheme.inverseSurface,
  //           borderRadius: BorderRadius.circular(16),
  //           child: Container(
  //               width: context.widthP(80),
  //               height: context.pageHeight(perc: 80),
  //               padding: EdgeInsets.all(padding),
  //               child: SchedaAboutPage(
  //                   width: context.widthP(80) - padding * 2,
  //                   height: context.pageHeight(perc: 80) - padding * 2,
  //                   titles: const [
  //                     "Skills",
  //                     "About me",
  //                     "Content 3",
  //                     "Content 4"
  //                   ],
  //                   bodies: [
  //                     Column(
  //                         children: buildSkillsWidget(
  //                             context, columnWidthPerc, padding)),
  //                     SizedBox(
  //                       width: context.widthP(columnWidthPerc) - 2 * padding,
  //                       child: Text(Info.aboutMe,
  //                           style: context.textTheme
  //                               .bodyLarge!
  //                               .copyWith(
  //                                   color:
  //                                       context.colorScheme.onInverseSurface)),
  //                     ),
  //                     const Text("Bye"),
  //                     const Text("Ciao"),
  //                   ]).animate(
  //                   target: controller.currentSection == section.title ? 1 : 0)
  //               // .fadeIn(delay: 100.ms, begin: 0.5),
  //               ),
  //         ),
  //       );
  //     },
  //   );
  // }

  List<Column> buildSkillsWidget(
      BuildContext context, double columnWidthPerc, double padding) {
    return Info.languages
        .map((String k, int v) => MapEntry(
            k,
            // TO FIX
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  k,
                  style: context.textTheme.bodyLarge!
                      .copyWith(color: context.colorScheme.onInverseSurface),
                ),
                Container(
                  width: context.widthP(columnWidthPerc) - 2 * padding,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: LinearPercentIndicator(
                    padding: const EdgeInsets.all(0),
                    lineHeight: context.heightP(1),
                    percent: v / 100,
                    animation: true,
                    animationDuration: 1500,
                    barRadius: const Radius.circular(8),
                    trailing: Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "$v%",
                          style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.onInverseSurface),
                        )),
                    backgroundColor:
                        context.colorScheme.onInverseSurface.withOpacity(0.2),
                    progressColor: context.colorScheme.inversePrimary,
                  ),
                )
              ],
            )))
        .values
        .toList();
  }
}
