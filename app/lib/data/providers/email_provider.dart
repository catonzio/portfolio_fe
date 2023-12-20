import 'package:dio/dio.dart';
import 'package:portfolio/data/models/email.dart';
import 'package:portfolio/data/providers/client_provider.dart';

class EmailProvider {
  final ClientProvider clientProvider;

  EmailProvider(this.clientProvider);

  Future<bool> sendEmail(Email email) async {
    try {
      Response response =
          await clientProvider.client.post("/email/send", data: email);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
