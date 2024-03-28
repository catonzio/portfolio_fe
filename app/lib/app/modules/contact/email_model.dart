class Email {
  int? id;
  String? subject;
  String? senderEmail;
  String? senderName;
  String? body;

  Email({this.subject, this.senderEmail, this.senderName, this.body, this.id});

  Email.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    senderEmail = json['sender_email'];
    senderName = json['sender_name'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['subject'] = subject;
    data['sender_email'] = senderEmail;
    data['sender_name'] = senderName;
    data['body'] = body;
    return data;
  }
}
