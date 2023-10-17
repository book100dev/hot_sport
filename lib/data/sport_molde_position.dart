

class SportMoldePosition {
  SportMoldePosition({required this.x, required this.y});
  late double x;
  late double y;
  SportMoldePosition.fromJson(Map<String, dynamic> json) {
    x = double.parse(json['x'].toString());
    y = double.parse(json['y'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['x'] = x;
    data['y'] = y;
    return data;
  }

}