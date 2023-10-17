class SportMoldeTextStyle {
  SportMoldeTextStyle(
      {this.fontSize = 13,
      this.fontWeight = '',
      this.hexColor = '292a24',
      this.align = 'center',
      this.fontFamily = ''});
  //字体大小
  late double fontSize;
  //正常 加粗 、、
  late String fontWeight;
  //颜色
  late String hexColor;
  //对齐方式
  late String align;

  late String fontFamily;

  SportMoldeTextStyle.fromJson(Map<String, dynamic> json) {
    fontSize = double.parse(json['fontSize'].toString());
    hexColor = json['hexColor'];
    fontWeight = json['fontWeight'];
    align = json['align'];
    fontFamily = json['fontFamily'] ?? '思源黑体简体';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fontSize'] = fontSize;
    data['hexColor'] = hexColor;
    data['fontWeight'] = fontWeight;
    data['align'] = align;
    data['fontFamily'] = fontFamily;
    return data;
  }
}
