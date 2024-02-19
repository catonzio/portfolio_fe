import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final ScrollController scrollController = ScrollController();

  final RxDouble _currentOffset = 0.0.obs;
  get currentOffset => _currentOffset.value;
  set currentOffset(value) => _currentOffset.value = value;

  final RxString _currentSection = "".obs;
  get currentSection => _currentSection.value;
  set currentSection(value) => _currentSection.value = value;

  final RxString _currentBgSection = "".obs;
  get currentBgSection => _currentBgSection.value;
  set currentBgSection(value) => _currentBgSection.value = value;

  final RxDouble _currentSectionScrollPerc = 0.0.obs;
  get currentSectionScrollPerc => _currentSectionScrollPerc.value;
  set currentSectionScrollPerc(value) =>
      _currentSectionScrollPerc.value = value;

  // final List<GlobalKey> sectionKeys = List.generate(
  //     Configs.sectionsInfo.keys.length, (index) => GlobalKey());
  final Map<String, GlobalKey> sectionKeys = Map.fromEntries(
      Configs.sectionsInfo.keys.map((e) => MapEntry(e, GlobalKey())));

  @override
  void onInit() {
    scrollController.addListener(scrollListener);
    currentSection = Configs.sectionsInfo.keys.toList()[0];
    currentBgSection = currentSection;

    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    currentOffset = scrollController.offset;
    setCurrentSection(Get.context);
    // debounce(_currentOffset, (_) => setCurrentSection(Get.context),
    //     time: 100.milliseconds);
  }

  returnUp() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  double maxScroll() {
    try {
      return scrollController.position.maxScrollExtent;
    } catch (e) {
      return 0;
    }
  }

  double minScroll() {
    try {
      return scrollController.position.minScrollExtent;
    } catch (e) {
      return 0;
    }
  }

  returnUpOffset() {
    return maxScroll() / 10;
    // maxScroll() - (maxScroll() - minScroll()) / 3;
  }

  void scrollToSection(BuildContext context, String text) {
    double perc =
        getHeightPercsUntil(Configs.sectionsInfo.keys.toList().indexOf(text));

    try {
      scrollController.animateTo(context.pageHeight(perc: perc),
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } catch (e) {
      print(e);
    }
  }

  double getHeightPercsUntil(int index) {
    // int index = Configs.sectionsInfo.keys.toList().indexOf(text);
    double perc = index == 0
        ? 0
        : Configs.sectionsInfo.values
            .map((e) => e.heightPerc)
            .toList()
            .sublist(0, index)
            .cast<double>()
            .reduce((a, b) => a + b);
    return perc;
  }

  void setCurrentSection(BuildContext? context) {
    if (context == null) return;

    Map<String, dynamic> sections = Configs.sectionsInfo;
    List<String> keys = sections.keys.toList();
    List<double> heightPercs =
        sections.values.map((e) => e.heightPerc).toList().cast<double>();
    List<double> confs =
        sections.values.map((e) => e.heightConfPerc).toList().cast<double>();
    double pageHeight = context.pageHeight();

    for (int i = 0; i < sections.length; i++) {
      double perc = getHeightPercsUntil(i) / 100;
      double lb = pageHeight * perc;
      double ub = pageHeight * (perc + heightPercs[i] / 100);
      double conf = pageHeight * confs[i] / 100;
      // double lb = context.pageHeight(perc: perc);
      // double ub = context.pageHeight(perc: perc + heightPercs[i]);
      // double conf = context.pageHeight(perc: confs[i]);

      if ((lb - conf <= currentOffset) && (currentOffset < ub + conf)) {
        currentBgSection = keys[i];
      }

      if ((lb <= currentOffset) && (currentOffset < ub)) {
        currentSection = keys[i];
        currentSectionScrollPerc = (currentOffset - lb) / (ub - lb);
      }
    }
  }
}
