import 'package:flutter/material.dart';
import 'package:dcatone/configs/configs.dart';
import 'package:dcatone/info/about_info.dart';

import 'package:dcatone/info/utils.dart';
import 'package:dcatone/info/work_info.dart';
import 'package:dcatone/widgets/about_me_data.dart';
import 'package:dcatone/widgets/community_button.dart';
import 'package:dcatone/widgets/custom_text_heading.dart';
import 'package:dcatone/widgets/tech_widget.dart';
import 'dart:math' as math;
// import 'package:universal_html/html.dart' as html;

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nAbout Me',
          ),
          const CustomSectionSubHeading(
            text: 'Get to know me :)',
          ),
          Space.y1!,
          Row(
            children: [
              Expanded(
                child: Transform(
                  transform: Matrix4.rotationY(math.pi),
                  alignment: Alignment.center,
                  child: Image.asset(
                    StaticUtils.coloredPhoto,
                    height: height * 0.8,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  padding: EdgeInsets.only(left: width < 1230 ? 25.0 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Who am I?',
                        style: AppText.b1!.copyWith(
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      Space.y1!,
                      Text(
                        AboutInfo.aboutMeHeadline,
                        style: AppText.b1b!.copyWith(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Space.y!,
                      Text(
                        AboutInfo.aboutMeDetail,
                        style: AppText.b2!.copyWith(
                          height: 2,
                          letterSpacing: 1.1,
                          fontFamily: 'Montserrat',
                          fontSize: AppDimensions.normalize(5),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Space.y!,
                      Divider(
                        color: Colors.grey[800],
                        thickness: AppDimensions.normalize(0.5),
                      ),
                      Space.y!,
                      Text(
                        'Technologies I have worked with:',
                        style: AppText.b1!.copyWith(
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      Space.y!,
                      SizedBox(
                        // width: width * 0.5,
                        height: height * (0.1 * kTools.length / 8),
                        child: GridView.count(
                          crossAxisCount: 8,
                          childAspectRatio: 1.6,
                          children: kTools
                              .map((e) => ToolTechWidget(
                                    techName: e,
                                  ))
                              .toList(),
                        ),
                      ),
                      // Row(
                      //   children: kTools
                      //       .map((e) => ToolTechWidget(
                      //             techName: e,
                      //           ))
                      //       .toList(),
                      // ),
                      Space.y!,
                      Divider(
                        color: Colors.grey[800],
                        thickness: AppDimensions.normalize(0.5),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AboutMeData(
                                data: "Name",
                                information: AboutInfo.name,
                              ),
                              AboutMeData(
                                data: "Age",
                                information: (DateTime.now()
                                            .difference(DateTime(1997, 5, 14))
                                            .inDays ~/
                                        365)
                                    .toString(),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AboutMeData(
                                data: "Email",
                                information: AboutInfo.email,
                              ),
                              AboutMeData(
                                data: "From",
                                information: AboutInfo.address,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Space.y1!,
                      Row(
                        children: [
                          SizedBox(
                            height: AppDimensions.normalize(13),
                            width: AppDimensions.normalize(40),
                            child: OutlinedButton(
                              onPressed: () => {},
                              // html.window.open(StaticUtils.resume, 'pdf'),
                              child: const Text(
                                "Resume",
                              ),
                            ),
                          ),
                          Space.x1!,
                          Container(
                            color: Colors.grey[900]!,
                            width: AppDimensions.normalize(30),
                            height: AppDimensions.normalize(0.5),
                          ),
                          ...WorkInfo.logos.asMap().entries.map(
                                (e) => Expanded(
                                  child: CommunityIconBtn(
                                    icon: e.value,
                                    link: WorkInfo.communityLinks[e.key],
                                    height: WorkInfo.communityLogoHeight[e.key],
                                  ),
                                ),
                              )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width < 1230 ? width * 0.05 : width * 0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
