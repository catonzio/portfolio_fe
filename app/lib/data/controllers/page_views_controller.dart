import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewsController extends GetxController {
  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  RxDouble pageValue = 0.0.obs;

  final PageController pageController = PageController();

  @override
  void onInit() {
    pageController.addListener(() {
      currentIndex = pageController.page?.round() ?? 0;
      pageValue.value = pageController.page ?? 0.0;
    });
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    if (currentIndex > 0) {
      changePage(currentIndex - 1);
    }
  }

  void nextPage() {
    if (currentIndex < 2) {
      changePage(currentIndex + 1);
    }
  }
}
