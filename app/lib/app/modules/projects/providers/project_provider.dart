import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';

import '../project_model.dart';

class ProjectProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return Project.fromJson(map);
    //   if (map is List) {
    //     return map.map((item) => Project.fromJson(item)).toList();
    //   }
    // };
    httpClient.baseUrl = Constants.baseApiUrl;
  }

  Future<List<Project>> getAllProjects() async {
    return get('/projects').then((response) {
      return response.body == null
          ? <Project>[]
          : (response.body as List).map((e) => Project.fromJson(e)).toList();
    }).onError((error, stackTrace) {
      print(error);
      return <Project>[];
    });
  }

  Future<Project?> getProject(int id) async {
    final response = await get('/projects/$id');
    return response.body;
  }

  Future<Response<Project>> postProject(Project project) async =>
      await post('/projects', project);

  Future<Response> deleteProject(int id) async => await delete('/projects/$id');

  Future<String> projectReadme(int id) async {
    return get('/projects/readme/$id')
        .then((value) => value.body as String)
        .onError((error, stackTrace) => error as String);
  }
}
