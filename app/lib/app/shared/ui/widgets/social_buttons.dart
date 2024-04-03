import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/shared/models/social_data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String url;
  final String imagePath;

  const LinkButton(
      {super.key,
      this.height,
      this.width,
      required this.url,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrlString(url),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: ClipOval(
          child: Image.asset(
            imagePath,
            
            // color: Colors.red,
            // color: context.theme.colorScheme.onPrimaryContainer,
            fit: BoxFit.fill,
            // colorBlendMode: BlendMode.overlay,
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final SocialData socialData;
  final double? height;
  final double? width;

  const SocialButton(
      {super.key, required this.socialData, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return LinkButton(
      url: socialData.url!,
      imagePath: socialData.iconPath!,
      height: height,
      width: width,
    );
  }
}
