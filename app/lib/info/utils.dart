import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../views/about/about.dart';
import '../views/contact/contact.dart';
import '../views/home/home.dart';
import '../views/portfolio/portfolio.dart';
import '../views/services/services.dart';
import '../widgets/footer.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/me_buona-mobile.png';
  static const String coloredPhoto = 'assets/photos/me_buona.png';
  static const String blackWhitePhoto = 'assets/photos/me_buona-bw.png';

  // work
  static const String dsc = 'assets/work/dsc.png';
  static const String sastaticket = 'assets/work/st.png';
  static const String university = 'assets/work/Logo_Politecnico_Milano.png';
  static const String fullterIsb = 'assets/work/flutterIsl.png';

  // services
  static const String uiux = 'assets/services/ui.png';
  static const String blog = 'assets/services/blog.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png",
  ];

  static const List<String> socialLinks = [
    "https://facebook.com/catonzio",
    "https://instagram.com/catonzio",
    "https://www.linkedin.com/in/danilo-catone-660aa1174/",
    "https://github.com/catonzio",
  ];

  static const String resume =
      'https://drive.google.com/file/d/1bDNNrkQtNVJbXcdwMSx0crQQvAF_nMwV/view?usp=sharing';

  static const String gitHub = 'https://github.com/mhmzdev';

  static const List<String> animatedSubtitles = [
    "Data scientist",
    "Flutter Developer",
    "Software Engineer",
    "Constant learner",
    "A friend :)"
  ];
}

class BodyUtils {
  static const List<Widget> views = [
    Home(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}

// URL Launcher
void openURL(String url) => launchUrl(
      Uri.parse(url),
    );

// Tools & Tech
final kTools = [
  "Flutter",
  "Dart",
  "Python",
  "Java",
  "C++",
  "Flutter",
  "Dart",
  "Python",
  "Java",
  "C++",
  "Flutter",
  "Dart",
  "Python",
  "Java",
  "C++",
];
