import 'package:flutter/material.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/app/routes/app_pages.dart';
import 'package:portfolio/app/shared/controllers/pages_controller.dart';

void changePage(BuildContext context, PagesController controller, Offset event,
    void Function()? onChangePage, int? newIndex) {
  if (!controller.isAnimating) {
    newIndex ??= controller.onChange(event);
    if (newIndex == controller.currentIndex) return;
    if (onChangePage != null) {
      onChangePage();
    }
    // controller.currentIndex = newIndex;
    controller.isAnimating = true;

    Future.delayed(Constants.pageTransitionDuration, () {
      controller.isAnimating = false;
      controller.changePage(newIndex!);
    });

    Navigator.of(context).pushReplacementNamed(Routes.all[newIndex]);
  }
}
