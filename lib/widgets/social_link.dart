import 'package:dcatone/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_theme.dart';
import '../configs/space.dart';
import '../info/utils.dart';
import '../views/responsive.dart';

class SocialLink extends StatelessWidget {
  const SocialLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();
    return Wrap(
      runSpacing: AppDimensions.normalize(10),
      alignment: WrapAlignment.center,
      children: StaticUtils.socialIconURL
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding:
                  Responsive.isMobile(context) ? Space.all(0.2, 0) : Space.h!,
              child: IconButton(
                highlightColor: Colors.white54,
                splashRadius: AppDimensions.normalize(12),
                icon: Obx(() => Image.network(
                      e.value,
                      color: appController.isDark.value
                          ? Colors.white
                          : Colors.black,
                      height: Responsive.isMobile(context)
                          ? AppDimensions.normalize(10)
                          : null,
                    )),
                iconSize: Responsive.isMobile(context)
                    ? AppDimensions.normalize(10)
                    : AppDimensions.normalize(15),
                onPressed: () => openURL(
                  StaticUtils.socialLinks[e.key],
                ),
                hoverColor: AppTheme.c!.primary!,
              ),
            ),
          )
          .toList(),
    );
  }
}
