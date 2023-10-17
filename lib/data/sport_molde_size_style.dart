class SportMoldeSizeStyle {
  SportMoldeSizeStyle({required this.width, required this.height});
  
  double width = 0;
  double height = 0;

  SportMoldeSizeStyle.fromJson(Map<String, dynamic> json) {
    width = double.parse(json['width'].toString());
    height = double.parse(json['height'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
