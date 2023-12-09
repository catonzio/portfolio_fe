import 'package:dcatone/configs/configs.dart';
import 'package:dcatone/info/about_info.dart';
import 'package:dcatone/info/utils.dart';
import 'package:dcatone/info/work_info.dart';

import 'package:dcatone/widgets/custom_text_heading.dart';
// import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

import 'package:dcatone/widgets/about_me_data.dart';
import 'package:dcatone/widgets/community_button.dart';
import 'package:dcatone/widgets/tech_widget.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: CustomSectionHeading(
              text: '\nAbout Me',
            ),
          ),
          const Center(
            child: CustomSectionSubHeading(
              text: 'Get to know me :)',
            ),
          ),
          Space.y1!,
          Image.asset(
            StaticUtils.mobilePhoto,
            height: height * 0.27,
          ),
          Container(
            padding: Space.h1,
            child: Text(
              "Who am I?",
              style: AppText.b2!.copyWith(
                color: AppTheme.c!.primary,
              ),
            ),
          ),
          Space.y1!,
          Container(
            padding: Space.h1,
            child: Text(
              AboutInfo.aboutMeHeadline,
              style: AppText.b2b!.copyWith(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            padding: Space.h1,
            child: Text(
              AboutInfo.aboutMeDetail,
              style: AppText.l1!.copyWith(
                height: 2,
                letterSpacing: 1.1,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y!,
          Container(
            padding: Space.h1,
            child: Text(
              'Technologies I have worked with:',
              style: AppText.l1!.copyWith(
                color: AppTheme.c!.primary,
              ),
            ),
          ),
          Container(
            padding: Space.h1!,
            // width: width * 0.5,
            height: height * (0.05 * kTools.length / 8),
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
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y!,
          Container(
            padding: Space.h1!,
            child: Row(
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
                // SizedBox(
                //   width: width > 710 ? width * 0.2 : width * 0.05,
                // ),
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
          ),
          Space.y1!,
          Row(
            children: [
              SizedBox(
                height: AppDimensions.normalize(13),
                width: AppDimensions.normalize(40),
                child: OutlinedButton(
                  onPressed: () =>
                      {}, // html.window.open(StaticUtils.resume, 'pdf'),
                  child: const Text(
                    "Resume",
                  ),
                ),
              ),
              Space.x!,
              Container(
                width: width * 0.05,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[900]!,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: WorkInfo.logos
                        .asMap()
                        .entries
                        .map(
                          (e) => CommunityIconBtn(
                            icon: e.value,
                            link: WorkInfo.communityLinks[e.key],
                            height: WorkInfo.communityLogoHeight[e.key],
                          ),
                        )
                        .toList()),
              ),
            ],
          )
        ],
      ),
    );
  }
}
