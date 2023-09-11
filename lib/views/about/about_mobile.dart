import 'package:flutter/foundation.dart';
import 'package:dcatone/configs/configs.dart';
import 'package:dcatone/info/about_info.dart';
import 'package:dcatone/info/utils.dart';
import 'package:dcatone/info/work_info.dart';

import 'package:dcatone/widgets/custom_text_heading.dart';
// import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
// import 'package:dcatone/constants.dart';
import 'package:dcatone/widgets/about_me_data.dart';
import 'package:dcatone/widgets/community_button.dart';
import 'package:dcatone/widgets/tech_widget.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          Image.asset(
            StaticUtils.mobilePhoto,
            height: height * 0.27,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Who am I?",
              style: AppText.b2!.copyWith(
                color: AppTheme.c!.primary,
              ),
            ),
          ),
          Space.y1!,
          Text(
            AboutInfo.aboutMeHeadline,
            style: AppText.b2b!.copyWith(
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            AboutInfo.aboutMeDetail,
            style: AppText.l1!.copyWith(
              height: 2,
              letterSpacing: 1.1,
              fontFamily: 'Montserrat',
            ),
          ),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y!,
          Text(
            'Technologies I have worked with:',
            style: AppText.l1!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Space.y!,
          Container(
            width: width * 0.9,
            height: height * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: kTools.length,
              itemBuilder: (context, index) =>
                  ToolTechWidget(techName: kTools[index]),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: kTools
          //       .map(
          //         (e) => ToolTechWidget(techName: e),
          //       )
          //       .toList(),
          // ),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          AboutMeData(
            data: "Name",
            information: AboutInfo.name,
          ),
          AboutMeData(
            data: "Email",
            information: AboutInfo.email,
          ),
          Space.y!,
          OutlinedButton(
              child: const Text("Resume"),
              onPressed: () {
                // kIsWeb
                // ? html.window.open(StaticUtils.resume, "pdf")
                openURL(StaticUtils.resume);
              }),
          Space.y!,
          Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
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
        ],
      ),
    );
  }
}
