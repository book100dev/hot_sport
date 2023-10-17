class SportMoldeFood {
  SportMoldeFood({required this.showFoodName, required this.showFoodUnit});
  late bool showFoodName;
  late bool showFoodUnit;
  String? iconColor;
  int? iconStyle;
  SportMoldeFood.fromJson(Map<String, dynamic> json) {
    showFoodName = json['showFoodName'];
    showFoodUnit = json['showFoodUnit'];
    iconColor = json['iconColor'];
    iconStyle = json['iconStyle'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['showFoodName'] = showFoodName;
    data['showFoodUnit'] = showFoodUnit;
    data['iconColor'] = iconColor;
    data['iconStyle'] = iconStyle;
    return data;
  }
}
