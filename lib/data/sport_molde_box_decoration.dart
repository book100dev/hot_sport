
import 'box_border_type.dart';
class SportMoldeBoxDecoration {
  SportMoldeBoxDecoration(
      {this.hexBorderColor = '3c3c3c',
      this.borderRadius = 0,
      this.lineWidth = 1,
      this.lineType = BoxBorderType.none});
  late String hexBorderColor;
  late double borderRadius;
  late double lineWidth;
  late BoxBorderType lineType;

  SportMoldeBoxDecoration.fromJson(Map<String, dynamic> json) {
    hexBorderColor = json['hexBorderColor'];
    borderRadius = double.parse(json['borderRadius'].toString());
    lineWidth = double.parse(json['lineWidth'].toString());
    lineType = BoxBorderType.values[json['lineType']];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hexBorderColor'] = hexBorderColor;
    data['borderRadius'] = borderRadius;
    data['lineWidth'] = lineWidth;
    data['lineType'] = lineType.index;
    return data;
  }
}

