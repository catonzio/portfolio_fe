import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/config/info.dart';
import 'package:portfolio/data/models/section.dart';

class StatisticsDesktop extends StatelessWidget {
  final Section section;
  const StatisticsDesktop(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Dimensions.pageHeight(context);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: Info.skills
            .map((key, value) => MapEntry(
                  key,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        key,
                        maxLines: 1,
                        style: context.textTheme.headlineSmall,
                      ),
                      CircularPercentIndicator(
                          radius: Size(context.fullWidth, context.fullHeight)
                                  .shortestSide *
                              0.1,
                          percent: value / 100,
                          lineWidth: Size(context.widthP(2), context.heightP(2))
                              .shortestSide,
                          animation: true,
                          animationDuration: 1000,
                          progressColor: context.colorScheme.inversePrimary,
                          center: Text("$value%")),
                    ],
                  ),
                ))
            .values
            .toList());
  }
}
