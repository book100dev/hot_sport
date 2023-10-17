class SportMoldeBackground {
  SportMoldeBackground({required this.imageUrl, required this.hexColor});
  late String imageUrl;
  late String hexColor;
  SportMoldeBackground.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    hexColor = json['hexColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['hexColor'] = hexColor;
    return data;
  }
}