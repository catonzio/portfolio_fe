import 'package:get/get.dart';

import '../work_experience_model.dart';

class WorkExperienceProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return WorkExperience.fromJson(map);
      if (map is List) {
        return map.map((item) => WorkExperience.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<WorkExperience?> getWorkExperience(int id) async {
    final response = await get('workexperience/$id');
    return response.body;
  }

  Future<Response<WorkExperience>> postWorkExperience(
          WorkExperience workexperience) async =>
      await post('workexperience', workexperience);
  Future<Response> deleteWorkExperience(int id) async =>
      await delete('workexperience/$id');
}
