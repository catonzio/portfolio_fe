import 'package:portfolio/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController {
  static PagesController get to => Get.find<PagesController>();

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  final RxBool _isAnimating = false.obs;
  bool get isAnimating => _isAnimating.value;
  set isAnimating(bool value) => _isAnimating.value = value;

  final RxList<bool> isHovering =
      List.generate(Routes.numRoutes, (index) => false).obs;

  void changePage(int index) {
    currentIndex = index;
  }

  void setHovering(int index, bool value) {
    for (int i = 0; i < isHovering.length; i++) {
      isHovering[i] = false;
    }
    isHovering[index] = value;
  }

  int onChange(dynamic movement) {
    if (isAnimating) {
      return currentIndex;
    }
    int newIndex = currentIndex;
    print(movement);
    if (movement is Offset) {
      // print(movement.dy);
      if (movement.dy > 80) {
        newIndex += 1;
      } else if (movement.dy < -80) {
        newIndex -= 1;
      }
    } else if (movement is DragEndDetails) {
      // print(movement.velocity.pixelsPerSecond.dy);
      if (movement.velocity.pixelsPerSecond.dy < -80) {
        newIndex += 1;
      } else if (movement.velocity.pixelsPerSecond.dy > 80) {
        newIndex -= 1;
      }
    }
    return newIndex.clamp(0, Routes.numRoutes - 1);
  }
}
