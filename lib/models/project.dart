class Project {
  final int id;
  final String name;
  final String description;
  final String imagePath;
  final String url;
  final bool preview;

  Project(
      {required this.id,
      required this.name,
      required this.description,
      required this.imagePath,
      required this.url,
      required this.preview});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imagePath: json['image_path'],
      url: json['url'],
      preview: json['preview'],
    );
  }
}
