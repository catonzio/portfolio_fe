import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/data/models/project.dart';

class ProjectDetailController extends GetxController {
  late String imagePath;
  late String title;
  late String description;
  late String url;

  Widget? iFrame;

  @override
  void onInit() {
    if (Get.arguments == null) {
      imagePath = '';
      title = '';
      description = '';
      url = '';
    } else if (Get.arguments['projectName'] != null &&
        Get.arguments['projectName'] != '') {
      Project projectDetails =
          Configs.projectsDetails[Get.arguments['projectName']]!;
      imagePath = projectDetails.imagePath;
      title = projectDetails.name;
      description = projectDetails.description;
      url = projectDetails.url;
    }

    super.onInit();
  }

  Widget getIframe() {
    IFrameElement element = IFrameElement()
      ..src = url
      ..style.border = 'none'
      ..style.width = '100%' // Set the width using CSS style
      ..style.height = '100%'; // Set the height using CSS style
    platformViewRegistry.registerViewFactory(
        'iframeElement$title', (int viewId) => element,
        isVisible: true);
    iFrame = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement$title',
    );
    return iFrame!;
    // if (iFrame == null) {
    //   IFrameElement element = IFrameElement()
    //     ..src = projectDetails['url']
    //     ..style.border = 'none'
    //     ..style.width = '100%' // Set the width using CSS style
    //     ..style.height = '100%'; // Set the height using CSS style
    //   platformViewRegistry.registerViewFactory(
    //       'iframeElement', (int viewId) => element,
    //       isVisible: true);
    //   iFrame = HtmlElementView(
    //     key: UniqueKey(),
    //     viewType: 'iframeElement',
    //   );
    //   return iFrame!;
    // } else {
    //   return iFrame!;
    // }
  }
}
