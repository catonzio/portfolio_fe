import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/data/controllers/project_detail_controller.dart';

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
        width: context.fullWidth,
        height: context.pageHeight(),
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
                  width: context.widthP(30),
                  height: context.pageHeight(perc: 80),
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
