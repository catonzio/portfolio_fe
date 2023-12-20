import 'package:get/get.dart';
import 'package:portfolio/data/controllers/project_detail_controller.dart';

class ProjectDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProjectDetailController());
  }
}
