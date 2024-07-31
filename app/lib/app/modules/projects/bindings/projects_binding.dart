import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/providers/project_provider.dart';

import '../controllers/projects_controller.dart';

class ProjectsBinding extends Bindings {
  @override
  void dependencies() {
    ProjectProvider provider = Get.put(ProjectProvider());
    Get.lazyPut<ProjectsController>(
      () => ProjectsController(provider: provider),
    );
  }
}
