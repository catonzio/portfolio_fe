import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/providers/project_provider.dart';

import '../controllers/project_detail_controller.dart';

class ProjectDetailBinding extends Bindings {
  @override
  void dependencies() {
    ProjectProvider provider = Get.put(ProjectProvider());
    Get.lazyPut<ProjectDetailController>(
        () => ProjectDetailController(provider: provider));
  }
}
