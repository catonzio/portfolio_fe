import 'package:dio/dio.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ClientProvider {
  final String url = "http://localhost:3500/portfolio/api";
  final Dio client = Dio(BaseOptions(
      baseUrl: "http://localhost:3500/portfolio/api",
      connectTimeout: 5000.ms,
      receiveTimeout: 3000.ms,
      contentType: 'application/json',
      responseType: ResponseType.json));
}
