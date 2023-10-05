import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/models/project.dart';

class ApiController extends GetxController {
  final String url = "http://localhost:3500/portfolio/api";
  final dio.Dio client = dio.Dio(dio.BaseOptions(
      baseUrl: "http://localhost:3500/portfolio/api",
      connectTimeout: 5000.ms,
      receiveTimeout: 3000.ms,
      contentType: 'application/json',
      responseType: dio.ResponseType.json));

  @override
  void onInit() {
    sendUserLocation();
    fetchProjects();
    super.onInit();
  }

  Future<void> fetchProjects() async {
    try {
      dio.Response response = await client.get("/projects");
      if (response.statusCode == 200) {
        List<dynamic> projects =
            response.data.map((e) => Project.fromJson(e)).toList();
        Configs.projectsDetails = {for (Project e in projects) e.name: e};
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, String>> getClientInfo() async {
    dio.Dio client = dio.Dio();

    client.options.headers['Content-Type'] = 'application/json';
    client.options.headers['Accept'] = 'application/json';
    String url = "https://ipinfo.io?token=d2f8a61be5bc4a";
    Map<String, String> result = {};
    // Making a GET request
    dio.Response response = await client.get(url);

    // Check the HTTP status code
    if (response.statusCode == 200) {
      result = {for (var e in response.data.entries) e.key: e.value};
    }

    return result;
  }

  Future<void> sendUserLocation() async {
    // ip, city, region, country
    Map<String, String> resp = await getClientInfo();
    Map<String, String> data = {
      "ip": resp['ip'] ?? '',
      "city": resp['city'] ?? '',
      "region": resp['region'] ?? '',
      "country": resp['country'] ?? '',
    };
    try {
      await client.post("/visits", data: data);
    } catch (e) {
      print(e);
    }
  }
}
