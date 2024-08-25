import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';

import '../email_model.dart';

class EmailProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return Email.fromJson(map);
    //   if (map is List) return map.map((item) => Email.fromJson(item)).toList();
    // };
    httpClient.baseUrl = '${Constants.baseApiUrl}/email';
  }

  Future<Email?> getEmail(int id) async {
    final response = await get('email/$id');
    return response.body;
  }

  Future<Response<Map>?> sendEmail(Email email) async {
    try {
      Response<Map> response = await post("/send", email.toJson());
      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<Response<Email>> postEmail(Email email) async =>
      await post('email', email);

  Future<Response> deleteEmail(int id) async => await delete('email/$id');
}
