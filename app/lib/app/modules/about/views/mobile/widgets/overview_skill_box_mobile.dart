import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewSkillBoxMobile extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String? iconPath;
  final IconData? icon;

  const OverviewSkillBoxMobile(
      {super.key,
      required this.width,
      required this.height,
      this.iconPath,
      this.icon,
      required this.title})
      : assert((iconPath != null) ^ (icon != null));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: width, // context.width * 0.25,
        height: height, // context.width * 0.25,
        decoration: BoxDecoration(
            color: context.theme.colorScheme.primaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurStyle: BlurStyle.normal,
                blurRadius: 30,
              )
            ]),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconPath != null
                ? Image.asset(
                    iconPath!,
                    width: width * 0.3,
                    height: height * 0.3,
                    color: Colors.white,
                  )
                : Icon(
                    icon,
                    size: width * 0.3,
                    color: Colors.white,
                  ),
            Text(title,
                textAlign: TextAlign.center,
                style:
                    context.textTheme.bodySmall?.copyWith(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
