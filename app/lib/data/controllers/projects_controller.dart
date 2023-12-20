import 'package:get/get.dart';

class ProjectsController extends GetxController {
  final RxBool _isHovering = false.obs;
  get isHovering => _isHovering.value;
  set isHovering(value) => _isHovering.value = value;
}
