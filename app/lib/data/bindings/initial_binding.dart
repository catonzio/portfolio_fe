import 'package:get/get.dart';
import 'package:portfolio/data/controllers/page2_controller.dart';
import 'package:portfolio/data/controllers/page_views_controller.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageViewsController());
    Get.lazyPut(() => Page2Controller());
    Get.lazyPut(() => PagesController());
    // Get.put(Page2Controller(), permanent: true);
  }
}
