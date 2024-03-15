import 'package:get/get.dart';
import 'package:portfolio/data/controllers/page2_controller.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PagesController());
    Get.lazyPut(() => Page2Controller());
    // Get.put(Page2Controller(), permanent: true);
  }
}
