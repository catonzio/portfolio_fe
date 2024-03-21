import 'package:get/get.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

class Trial2Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Trial2Controller(), permanent: false);
  }
}