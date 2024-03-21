import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app//shared/ui/mypage.dart';

import '../controllers/projects_controller.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MyPage(
        body: Container(
            color: Colors.blue[200],
            child: const Center(child: Text('This is the projects page'))),
        isScrollEnabled: (_) => true);
  }
}
