import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutDesktopView extends StatelessWidget {
  const AboutDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Padding(
        padding: const EdgeInsets.all(64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("About me",
                style: GoogleFonts.poppins(
                    fontSize: 60, fontWeight: FontWeight.bold)),
            Text(
              "I am a passionate Flutter Developer who loves to create beautiful apps.",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            const Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                AboutBox(
                  iconPath: "assets/images/developer.png",
                  title: "Developer",
                ),
                AboutBox(
                  iconPath: "assets/images/software_engineer.png",
                  title: "Software Engineer",
                ),
                AboutBox(
                  iconPath: "assets/images/architect.png",
                  title: "Architect",
                ),
                AboutBox(
                    icon: Icons.brightness_auto_rounded,
                    title: "Data Scientist")
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AboutBox extends StatelessWidget {
  final String? iconPath;
  final IconData? icon;
  final String title;

  const AboutBox({super.key, this.iconPath, this.icon, required this.title})
      : assert(iconPath != null || icon != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 200, // context.width * 0.25,
        height: 200, // context.width * 0.25,
        decoration: const BoxDecoration(
            color: Color(0xFF333333),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurStyle: BlurStyle.normal,
                blurRadius: 30,
              )
            ]),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconPath != null
                ? Image.asset(
                    iconPath!,
                    width: 60,
                    height: 60,
                    color: Colors.white,
                  )
                : Icon(
                    icon,
                    size: 60,
                    color: Colors.white,
                  ),
            Text(
              title,
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
