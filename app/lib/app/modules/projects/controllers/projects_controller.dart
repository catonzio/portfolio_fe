import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';

class ProjectsController extends GetxController {
  static ProjectsController get to => Get.find<ProjectsController>();

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  final RxList<bool> isHovering =
      List.generate(Constants.projects.length, (index) => false).obs;

  final RxList<ExpandableController> expandableControllers = List.generate(
    Constants.projects.length,
    (index) => ExpandableController(),
  ).obs;

  @override
  void onInit() {
    updateExpanded();
    super.onInit();
  }

  void updateExpanded() {
    for (var controller in expandableControllers) {
      controller.expanded = false;
    }
    expandableControllers[currentIndex].expanded = true;
    // final int currentHovering = isHovering.indexOf(true);
    // if (currentHovering != -1) {
    //   expandableControllers[currentHovering].expanded = true;
    // }
  }

  bool isScrollEnabled(Offset offset) {
    return isHovering.where((p0) => p0).isEmpty;
  }

  void onTap(int index) {
    currentIndex = index;
    updateExpanded();
  }

  void onHover(int index, bool value) {
    for (int i = 0; i < isHovering.length; i++) {
      if (i == index) {
        isHovering[i] = value;
      } else {
        isHovering[i] = false;
      }
    }
    // updateExpanded();
  }
}
