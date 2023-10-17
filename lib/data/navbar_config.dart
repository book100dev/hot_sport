import 'dart:convert';

T? asT<T>(dynamic value, {bool strong = false}) {
  if (strong && (value is int)) {
    return double.parse(value.toString()) as T;
  }
  // return value;
  if (value is T) {
    return value;
  }
  return null;
}

class NavBarConfig {
  NavBarConfig({
    this.navBarDisplayStatus,
    this.navBarBackgroundImageUrl,
    this.navBarBackgroundColor = '000',
    this.separatorColor = '000',
    this.indicatorColor = '000',
    this.runSpacing = 10,
    this.itemHeight = 35,
    this.itemWidth = 60,
    this.contentMargin = 20,
    this.radius = 8,
    this.itemRadius = 5,
    this.unselectedLabelColor = '#333333',
    this.labelColor = '#f60e0e',
    this.unselectedLabelBackgroundColor = '',
    this.itemBackgroundColor = '#bebe92',
    this.unselectedLabelBackgroundImage = '',
    this.itemlBackgroundImage = '',
    this.lableFontSize = 15,
    this.fontFamily = 'W05',
    this.fontWeight = 'Normal',
    this.unselectedLabeFontSize = 15,
  });

  factory NavBarConfig.fromJson(Map<String, dynamic> jsonRes) => NavBarConfig(
        navBarDisplayStatus: asT<int?>(jsonRes['navBarDisplayStatus']),
        navBarBackgroundImageUrl:
            asT<String?>(jsonRes['navBarBackgroundImageUrl']),
        navBarBackgroundColor: asT<String?>(jsonRes['navBarBackgroundColor']),
        separatorColor: asT<String?>(jsonRes['separatorColor']),
        indicatorColor: asT<String?>(jsonRes['indicatorColor']),
        runSpacing: asT<double?>(jsonRes['runSpacing'],strong: true) ?? 10,
        itemHeight: asT<double?>(jsonRes['itemHeight'],strong: true) ?? 35,
        itemWidth: asT<double?>(jsonRes['itemWidth'],strong: true) ?? 50,
        contentMargin: asT<double?>(jsonRes['contentMargin'],strong: true) ?? 0,
        radius: asT<double?>(jsonRes['radius'],strong: true) ?? 0,
        itemRadius: asT<double?>(jsonRes['itemRadius'],strong: true) ?? 0,
        unselectedLabelColor:
            asT<String?>(jsonRes['unselectedLabelColor']) ?? '',
        labelColor: asT<String?>(jsonRes['labelColor']) ?? '',
        unselectedLabelBackgroundColor:
            asT<String?>(jsonRes['unselectedLabelBackgroundColor']) ?? '',
        itemBackgroundColor: asT<String?>(jsonRes['itemBackgroundColor']) ?? '',
        unselectedLabelBackgroundImage:
            asT<String?>(jsonRes['unselectedLabelBackgroundImage']) ?? '',
        itemlBackgroundImage:
            asT<String?>(jsonRes['itemlBackgroundImage']) ?? '',
        lableFontSize: asT<double?>(jsonRes['lableFontSize'],strong: true) ?? 15,
        fontFamily: asT<String?>(jsonRes['fontFamily']),
        fontWeight: asT<String?>(jsonRes['fontWeight']),
        unselectedLabeFontSize: asT<double?>(jsonRes['lableFontSize'],strong: true) ?? 15,
            //asT<double?>(jsonRes['unselectedLabeFontSize'],strong: true) ?? 15,
      );

  int? navBarDisplayStatus;
  String? navBarBackgroundImageUrl;
  String? navBarLogoUrl;
  String? navBarBackgroundColor;
  String? separatorColor;
  String? indicatorColor;
  double? runSpacing;
  double? itemHeight;
  double? itemWidth;
  double? contentMargin;
  double? radius;
  double? itemRadius;
  String? unselectedLabelColor;
  String? labelColor;
  String? unselectedLabelBackgroundColor;
  String? itemBackgroundColor;
  String? unselectedLabelBackgroundImage;
  String? itemlBackgroundImage;
  double? lableFontSize;
  String? fontFamily;
  String? fontWeight;
  double? unselectedLabeFontSize;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'navBarDisplayStatus': navBarDisplayStatus,
        'navBarBackgroundImageUrl': navBarBackgroundImageUrl,
        'navBarBackgroundColor': navBarBackgroundColor,
        'separatorColor': separatorColor,
        'indicatorColor': indicatorColor,
        'runSpacing': runSpacing ?? 10,
        'itemHeight': itemHeight ?? 35.0,
        'itemWidth': itemWidth ?? 50.0,
        'contentMargin': contentMargin ?? 0,
        'radius': radius ?? 0,
        'itemRadius': itemRadius ?? 0,
        'unselectedLabelColor': unselectedLabelColor ?? '',
        'unselectedLabelBackgroundColor': unselectedLabelBackgroundColor ?? '',
        'unselectedLabelBackgroundImage': unselectedLabelBackgroundImage ?? '',
        'labelColor': labelColor ?? '',
        'itemBackgroundColor': itemBackgroundColor ?? '',
        'itemlBackgroundImage': itemlBackgroundImage ?? '',
        'lableFontSize': lableFontSize,
        'fontFamily': fontFamily,
        'fontWeight': fontWeight,
        'unselectedLabeFontSize': unselectedLabeFontSize,
      };
}
