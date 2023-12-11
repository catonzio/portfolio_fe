import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/dimensions.dart';
import 'package:portfolio/controllers/project_detail_controller.dart';

class ProjectDetailDesktop extends StatelessWidget {
  final ProjectDetailController controller =
      Get.put(ProjectDetailController(), tag: Get.arguments['projectName']);

  ProjectDetailDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Dimensions.width(context),
        height: Dimensions.pageHeight(context),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(controller.title),
              TextButton(
                  onPressed: () {
                    Get.back(closeOverlays: true);
                  },
                  child: const Text("Back")),
              Container(
                  width: Dimensions.width(context, perc: 30),
                  height: Dimensions.pageHeight(context, perc: 80),
                  color: Colors.white,
                  child: Stack(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      controller.getIframe(),
                    ],
                  ))
            ]),
      ),
    );
  }
}
