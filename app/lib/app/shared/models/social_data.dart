class SocialData {
  int? id;
  String? name;
  String? iconPath;
  String? url;

  SocialData({this.id, this.name, this.iconPath, this.url});

  SocialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconPath = json['iconPath'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['iconPath'] = iconPath;
    data['url'] = url;
    return data;
  }
}
