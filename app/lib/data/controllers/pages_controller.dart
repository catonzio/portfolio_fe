import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/pages.dart';

class PagesController extends GetxController {
  static PagesController get to => Get.find<PagesController>();

  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
  }

  int onChange(dynamic movement) {
    int newIndex = 0;
    if (movement is Offset) {
      if (movement.dy > 0) {
        newIndex = currentIndex + 1;
      } else {
        newIndex = currentIndex - 1;
      }
    } else if (movement is DragEndDetails) {
      if (movement.velocity.pixelsPerSecond.dy < 0) {
        newIndex = currentIndex + 1;
      } else {
        newIndex = currentIndex - 1;
      }
    }
    return newIndex.clamp(0, Pages.pages.length - 1);
  }

  // void onScrollEvent(Offset scrollDelta, Function(int, int) changePage) {
  //   int newIndex;

  //   if (scrollDelta.dy > 0) {
  //     newIndex = currentIndex + 1;
  //   } else {
  //     newIndex = currentIndex - 1;
  //   }
  //   changePage(currentIndex, newIndex);
  // }

  // void onVerticalDragEnd(DragEndDetails details, Function(int, int) changePage) {
  //   int newIndex;

  //   if (details.velocity.pixelsPerSecond.dy < 0) {
  //     newIndex = currentIndex + 1;
  //   } else {
  //     newIndex = currentIndex - 1;
  //   }
  //   changePage(currentIndex, newIndex);
  // }
}
