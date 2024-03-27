class Project {
  int? id;
  String? name;
  String? version;
  String? description;
  String? imagePath;

  Project({this.id, this.name, this.version, this.description, this.imagePath});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    version = json['version'];
    description = json['description'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['version'] = version;
    data['description'] = description;
    data['imagePath'] = imagePath;
    return data;
  }
}
