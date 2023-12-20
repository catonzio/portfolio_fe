import 'package:portfolio/data/models/email.dart';
import 'package:portfolio/data/providers/email_provider.dart';

class EmailRepository {
  final EmailProvider emailProvider;

  EmailRepository(this.emailProvider);

  Future<bool> sendEmail(Email email) async {
    return await emailProvider.sendEmail(email);
  }
}
