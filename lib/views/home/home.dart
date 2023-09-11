import 'package:dcatone/views/home/home_mobile.dart';
import 'package:dcatone/views/responsive.dart';
import 'package:flutter/material.dart';

import 'home_desktop.dart';
import 'home_tab.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      desktop: HomeDesktop(),
      tablet: HomeTab(),
    );
  }
}
