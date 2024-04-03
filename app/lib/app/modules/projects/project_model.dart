class Project {
  int? id;
  String? name;
  String? version;
  String? description;
  String? imagePath;
  String? url;
  String? githubUrl;

  Project(
      {this.id,
      this.name,
      this.version,
      this.description,
      this.imagePath,
      this.url, this.githubUrl});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    version = json['version'];
    description = json['description'];
    imagePath = json['imagePath'];
    url = json['url'];
    githubUrl = json['githubUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['version'] = version;
    data['description'] = description;
    data['imagePath'] = imagePath;
    data['url'] = url;
    data['githubUrl'] = githubUrl;
    return data;
  }
}
