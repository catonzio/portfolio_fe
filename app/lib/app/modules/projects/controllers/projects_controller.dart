import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/app/modules/projects/providers/project_provider.dart';

class ProjectsController extends GetxController {
  static ProjectsController get to => Get.find<ProjectsController>();

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  final RxList<bool> isHovering = <bool>[].obs;

  final RxList<ExpandableController> expandableControllers =
      <ExpandableController>[].obs;

  final ProjectProvider provider;

  final RxList<Project> projects = <Project>[].obs;
  final List<Project> fakeProjects = List.generate(4, (index) => Project());
  final RxBool isFetchingProjects = false.obs;

  ProjectsController({required this.provider});

  @override
  Future<void> onInit() async {
    await fetchProjects();
    expandableControllers.addAll(List.generate(
      projects.length,
      (index) => ExpandableController(),
    ));
    print("${projects.length} ${expandableControllers.length}");
    isHovering.addAll(List.generate(projects.length, (index) => false));
    updateExpanded();
    super.onInit();
  }

  Future<void> fetchProjects() async {
    isFetchingProjects.value = true;
    final projects = await provider.getAllProjects();
    this.projects.addAll(projects);
    isFetchingProjects.value = false;
  }

  void updateExpanded() {
    for (var controller in expandableControllers) {
      controller.expanded = false;
    }
    expandableControllers[currentIndex].expanded = true;
    // final int currentHovering = isHovering.indexOf(true);
    // if (currentHovering != -1) {
    //   expandableControllers[currentHovering].expanded = true;
    // }
  }

  bool isScrollEnabled(Offset offset) {
    return isHovering.where((p0) => p0).isEmpty;
  }

  void onTap(int index) {
    currentIndex = index;
    updateExpanded();
  }

  void onHover(int index, bool value) {
    for (int i = 0; i < isHovering.length; i++) {
      if (i == index) {
        isHovering[i] = value;
      } else {
        isHovering[i] = false;
      }
    }
    // updateExpanded();
  }
}
