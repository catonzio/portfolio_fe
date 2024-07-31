class Project {
  int? id;
  String? name;
  // String? version;
  String? description;
  String? imagePath;
  String? url;
  String? githubUrl;
  bool? preview;

  Project({
    this.id,
    this.name,
    // this.version,
    this.description,
    this.imagePath,
    this.url,
    this.githubUrl,
    this.preview,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
      id: json['id'],
      name: json['name'],
      // version: json['version'],
      description: json['description'],
      imagePath: json['image_path'],
      url: json['url'],
      githubUrl: json['github_url'],
      preview: json['preview']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
// "version": version,
        "description": description,
        "image_path": imagePath,
        "url": url,
        "github_url": githubUrl,
        "preview": preview
      };

  bool get hasGithub => githubUrl != null && githubUrl!.isNotEmpty;
}
