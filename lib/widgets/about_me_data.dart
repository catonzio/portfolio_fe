import 'package:dcatone/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:dcatone/configs/app_typography.dart';
import 'package:get/get.dart';

class AboutMeData extends StatelessWidget {
  final String data;
  final String information;
  final Alignment? alignment;
  final AppController appController = Get.find<AppController>();

  AboutMeData({
    Key? key,
    required this.data,
    required this.information,
    this.alignment,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$data: ",
              style: AppText.l1b!.copyWith(
                color: appController.isDark.value ? Colors.white : Colors.black,
              ),
            ),
            TextSpan(
              text: " $information\n",
              style: AppText.l1!.copyWith(
                color: appController.isDark.value ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
