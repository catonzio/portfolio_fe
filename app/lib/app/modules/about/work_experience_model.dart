class WorkExperience {
  final int id;
  final String company;
  final String role;
  final String date;
  final String description;

  WorkExperience({
    required this.id,
    required this.company,
    required this.role,
    required this.date,
    required this.description,
  });

  WorkExperience.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        company = json['company'],
        role = json['role'],
        date = json['date'],
        description = json['description'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company'] = company;
    data['role'] = role;
    data['date'] = date;
    data['description'] = description;
    return data;
  }
}
