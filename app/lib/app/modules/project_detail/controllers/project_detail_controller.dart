import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/app/modules/projects/providers/project_provider.dart';

class ProjectDetailController extends GetxController {
  static ProjectDetailController get to => Get.find();
  final ProjectProvider provider;
  Project project = Project();

  final RxBool isFetchingReadme = false.obs;
  final RxString readme = "".obs;

  ProjectDetailController({required this.provider});

  @override
  void onInit() {
    project = Get.arguments as Project;
    fetchReadme();
    super.onInit();
  }

  Future<void> fetchReadme() async {
    isFetchingReadme.value = true;
    readme.value = await provider.projectReadme(project.id!);
    isFetchingReadme.value = false;
  }

  void setProject(Project project) {
    this.project = project;
  }
}
