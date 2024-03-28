import 'package:get/get.dart';

import '../email_model.dart';

class EmailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Email.fromJson(map);
      if (map is List) return map.map((item) => Email.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Email?> getEmail(int id) async {
    final response = await get('email/$id');
    return response.body;
  }

  Future<Response<Email>> postEmail(Email email) async =>
      await post('email', email);
  Future<Response> deleteEmail(int id) async => await delete('email/$id');
}
