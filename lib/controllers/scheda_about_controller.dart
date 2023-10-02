import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchedaAboutController extends GetxController {
  final RxInt _count = 0.obs;
  int get count => _count.value;
  set count(int value) => _count.value = value;

  int maxCount = 0;

  final PageController pageController = PageController();

  void increment() {
    if (count + 1 < maxCount) {
      count++;
    } else {
      count = 0;
    }
  }

  void decrement() {
    if (count > 0) {
      count--;
    } else {
      count = maxCount - 1;
    }
  }
}
