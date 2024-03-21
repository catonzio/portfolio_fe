import 'package:get/get.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PagesController(), permanent: true);
  }
}
