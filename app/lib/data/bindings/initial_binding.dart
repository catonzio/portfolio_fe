import 'package:get/get.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => PageViewsController());
    // Get.lazyPut(() => Page2Controller());
    Get.put(PagesController(), permanent: true);
    // Get.lazyPut(() => PagesController(), fenix: true);
    // Get.put(Page2Controller(), permanent: true);
  }
}
