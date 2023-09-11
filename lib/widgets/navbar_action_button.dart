import 'package:dcatone/controllers/home_scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/app_theme.dart';
import '../configs/app_typography.dart';
import '../configs/space.dart';

class NavbarActionButton extends StatelessWidget {
  final String label;
  final int index;
  const NavbarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Space.h!,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: MaterialButton(
        splashColor: Colors.white54,
        highlightColor: Colors.white54,
        hoverColor: AppTheme.c!.primary,
        onPressed: () {
          Get.find<HomeScrollController>().scroll(index);
        },
        child: Padding(
          padding: Space.all(0.5, 0.45),
          child: Text(
            label,
            style: AppText.l1,
          ),
        ),
      ),
    );
  }
}
