import 'package:flutter/material.dart';
import 'package:portfolio/app/config/constants.dart';
import 'package:portfolio/app/routes/app_pages.dart';
import 'package:portfolio/app/shared/controllers/pages_controller.dart';

void changePage(BuildContext context, PagesController controller, dynamic event,
    void Function()? onChangePage, int? newIndex) {
  if (!controller.isAnimating) {
    if (newIndex == null && event != null) {
      newIndex = controller.onChange(event);
    }
    if (newIndex == controller.currentIndex) return;
    if (onChangePage != null) {
      print("Calling onChangePage");
      onChangePage();
    }
    // controller.currentIndex = newIndex;
    controller.isAnimating = true;

    Future.delayed(Constants.pageTransitionDuration, () {
      controller.isAnimating = false;
      controller.changePage(newIndex!);
    });

    Navigator.of(context).pushReplacementNamed(Routes.all[newIndex!]);
  }
}
