import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/config/info.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/data/controllers/home_controller.dart';
import 'package:portfolio/data/controllers/scheda_about_controller.dart';
import 'package:portfolio/data/models/section.dart';
import 'package:portfolio/widgets/scheda_about_page.dart';

class AboutMobile extends StatelessWidget {
  final Section section;
  const AboutMobile(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    double columnWidthPerc = 50;
    double padding = 4;
    Get.put(SchedaAboutController());

    return GetX<HomeController>(
      builder: (controller) {
        return Container(
          color: section.bgColor,
          alignment: Alignment.center,
          child: Material(
            elevation: 10,
            color: Themes.colorScheme(context).inverseSurface,
            borderRadius: BorderRadius.circular(16),
            child: Container(
                width: context.widthP(80),
                height: context.pageHeight(perc: 80),
                padding: EdgeInsets.all(padding),
                child: SchedaAboutPage(
                    width: context.widthP(80) - padding * 2,
                    height: context.pageHeight(perc: 80) - padding * 2,
                    titles: const [
                      "Skills",
                      "About me",
                      "Content 3",
                      "Content 4"
                    ],
                    bodies: [
                      Column(
                        children: buildSkillsWidget(
                                context, columnWidthPerc, padding) +
                            buildSkillsWidget(
                                context, columnWidthPerc, padding) +
                            buildSkillsWidget(
                                context, columnWidthPerc, padding),
                      ),
                      SizedBox(
                        width: context.widthP(columnWidthPerc) - 2 * padding,
                        child: Text(
                            Info.aboutMe +
                                Info.aboutMe +
                                Info.aboutMe +
                                Info.aboutMe,
                            style: Themes.textTheme(context)
                                .bodyLarge!
                                .copyWith(
                                    color: Themes.colorScheme(context)
                                        .onInverseSurface)),
                      ),
                      const Text("Bye"),
                      const Text("Ciao"),
                    ]).animate(
                    target: controller.currentSection == section.title ? 1 : 0)
                // .fadeIn(delay: 100.ms, begin: 0.5),
                ),
          ),
        );
      },
    );
  }

  List<Column> buildSkillsWidget(
      BuildContext context, double columnWidthPerc, double padding) {
    return Info.skills
        .map((String k, int v) => MapEntry(
            k,
            // TO FIX
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  k,
                  style: Themes.textTheme(context).bodyLarge!.copyWith(
                      color: Themes.colorScheme(context).onInverseSurface),
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
                          style: Themes.textTheme(context).bodyMedium!.copyWith(
                              color:
                                  Themes.colorScheme(context).onInverseSurface),
                        )),
                    backgroundColor: Themes.colorScheme(context)
                        .onInverseSurface
                        .withOpacity(0.2),
                    progressColor: Themes.colorScheme(context).inversePrimary,
                  ),
                )
              ],
            )))
        .values
        .toList();
  }
}
