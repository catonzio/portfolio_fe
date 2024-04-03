class WorkExperience {
  final int id;
  final String company;
  final String role;
  final String date;
  final String description;
  final String logoPath;

  WorkExperience({
    required this.id,
    required this.company,
    required this.role,
    required this.date,
    required this.description,
    required this.logoPath, // Added attribute
  });

  WorkExperience.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        company = json['company'],
        role = json['role'],
        date = json['date'],
        description = json['description'],
        logoPath = json['logoPath']; // Added attribute

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company'] = company;
    data['role'] = role;
    data['date'] = date;
    data['description'] = description;
    data['logoPath'] = logoPath; // Added attribute
    return data;
  }
}
