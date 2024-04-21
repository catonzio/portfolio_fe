import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/config/constants.dart';

void goToProjectDetail(BuildContext context, Project project) {
  Navigator.of(context).pushNamed('/project-detail', arguments: project);
  // Get.toNamed('/project-detail', arguments: project);
  Future.delayed(Constants.pageTransitionDuration,
      () => ProjectDetailController.to.setProject(project));
}

class ProjectDetailController extends GetxController {
  static ProjectDetailController get to => Get.find();

  Project project = Project();

  @override
  void onInit() {
    print(Get.arguments);
    project = Get.arguments as Project;
    super.onInit();
  }

  void setProject(Project project) {
    this.project = project;
  }
}
