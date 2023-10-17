/**
 * NAME
 * Created by hualala-songjie
 * Date: 2022/8/22
 */

// import 'dart:ui' show lerpDouble;

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
part of hot_sport;

// @immutable
class GlobalThemeData with Diagnosticable {
  /// Creates the set of properties used to configure [Tooltip]s.
  /*
  * 0、主题色
  * 1、菜品名称字号大小
  * 2、菜品名称颜色
  * 3、菜品简绍字号大小
  * 4、菜品简绍字号颜色
  * 5、菜品金额字号大小
  * 6、菜品金额字号颜色
  * 7、币种符号字号大小
  * 8、币种符号颜色
  * 9、数量号字号大小
  * 10、数量颜色
  * 11、图片是否隐藏
  * 12、规格、温度、辣度、做法、配菜分组 固定的不变
  * 13、规格、温度、辣度、做法、配菜分组 固定的不变【选中背景颜色、未选中背景颜色】
  * 14、规格、温度、辣度、做法、配菜分组 固定的不变【选中字体颜色、未选中字体颜色】
  * 15、加入购物车 背景色，
  * 16、加入购物车字体颜色，
  * 17、加减按钮颜色
  * 18、套餐子菜品图片是否显示
  * 19、套餐子菜品布局样式 list or flow
  * 20、弹框背景图片
  * 21、弹框背景色值
  * */
  const GlobalThemeData(
      {this.height,
      this.themeColor,
      this.foodNameFontSize,
      this.foodNameColor,
      this.foodUnitFontSize,
      this.foodUnitColor,
      this.foodPriceFontSize,
      this.foodPriceColor,
      this.symbolFontSize,
      this.symbolColor,
      this.countFontSize,
      this.countColor,
      this.visibility,
      this.sectionTitleFontSize,
      this.itemBgSelectColor,
      this.itemBgNormalColor,
      this.itemTextSelectColor,
      this.itemTextNormalColor,
      this.bottomButtonBgColor,
      this.bottomButtonTitleColor,
      this.bottomButtonFontSize,
      this.bottomButtonRadius,
      this.foodOptButtonThemeColor,
      this.foodOptSvgStyle,
      this.subFoodImageVisibility,
      this.subFoodLayoutMode,
      this.dialogBgImage,
      this.dialogBgColor,
      this.globalBgImageUrl,
      this.tagNormalStyle,
      this.tagSelectedStyle,
      this.tagHeaderStyle,
      this.titleHeaderStyle});

  /// The height of [Tooltip.child].
  final double? height;
  //主题颜色
  final Color? themeColor;
  //菜品名称字号大小
  final double? foodNameFontSize;
  //菜品名称颜色
  final Color? foodNameColor;
  //菜品规格字号大小
  final double? foodUnitFontSize;
  //菜品规格颜色
  final Color? foodUnitColor;
  //菜品金额字号大小
  final double? foodPriceFontSize;
  //菜品金额字号颜色
  final Color? foodPriceColor;
  //币种符号字号大小
  final double? symbolFontSize;
  //币种符号颜色
  final Color? symbolColor;
  //数量字号大小
  final double? countFontSize;
  //数量颜色
  final Color? countColor;
  //主菜图片是否隐藏
  final bool? visibility;
  //规格、温度、辣度、做法、配菜分组 固定的不变
  final double? sectionTitleFontSize;
  //item【选中背景颜色】
  final Color? itemBgSelectColor;
  //item【未选中背景颜色】
  final Color? itemBgNormalColor;
  //item text【选中背景颜色】
  final Color? itemTextSelectColor;
  //item text【未选中背景颜色】
  final Color? itemTextNormalColor;
  //加入购物车背景色
  final Color? bottomButtonBgColor;
  //加入购物车字体颜色
  final Color? bottomButtonTitleColor;
  //加入购物车字号大小
  final double? bottomButtonFontSize;
  //加入购物车按钮圆角
  final double? bottomButtonRadius;
  //菜品加减号按钮主题颜色
  final Color? foodOptButtonThemeColor;
  //菜品加减号按钮icon
  final int? foodOptSvgStyle;
  // final Icon? foodOptIcon;
  //子菜图片是否隐藏
  final bool? subFoodImageVisibility;
  //套餐子菜品布局样式 list or flow
  final SubFoodLayoutMode? subFoodLayoutMode;
  //dialog背景图片
  final Image? dialogBgImage;
  //dialog背景颜色
  final Color? dialogBgColor;
  //菜单的全局底图
  final String? globalBgImageUrl;

  final TextStyle? tagNormalStyle;

  final TextStyle? tagSelectedStyle;

  final TextStyle? tagHeaderStyle;

  final TextStyle? titleHeaderStyle;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  GlobalThemeData copyWith({
    double? height,
    Color? themeColor,
    //菜品名称字号大小
    final double? foodNameFontSize,
    //菜品名称颜色
    final Color? foodNameColor,
    //菜品描述字号大小
    final double? foodDesFontSize,
    //菜品描述颜色
    final Color? foodDesColor,
    //菜品金额字号大小
    final double? foodPriceFontSize,
    //菜品金额字号颜色
    final Color? foodPriceColor,
    //币种符号字号大小
    final double? symbolFontSize,
    //币种符号颜色
    final Color? symbolColor,
    //数量字号大小
    final double? countFontSize,
    //数量颜色
    final Color? countColor,
    //规格、温度、辣度、做法、配菜分组 固定的不变
    final double? sectionTitleFontSize,
    //item【选中背景颜色】
    final Color? itemBgSelectColor,
    //item【未选中背景颜色】
    final Color? itemBgNormalColor,
    //item text【选中背景颜色】
    final Color? itemTextSelectColor,
    //item text【未选中背景颜色】
    final Color? itemTextNormalColor,
    //加入购物车背景色
    final Color? bottomButtonBgColor,
    //加入购物车字体颜色
    final Color? bottomButtonTitleColor,
    //加入购物车字号大小
    final double? bottomButtonFontSize,
    //加入购物车按钮圆角
    final double? bottomButtonRadius,
    //菜品加减号按钮主题颜色
    final Color? foodOptButtonThemeColor,
    //套餐子菜品布局样式 list or flow
    final SubFoodLayoutMode? subFoodLayoutMode,
    //dialog背景图片
    final Image? dialogBgImage,
    //dialog背景颜色
    final Color? dialogBgColor,
    //菜单的全局底图
    final String? globalBgImageUrl,
    //标签常规
    final TextStyle? tagNormalStyle,
    //标签选中
    final TextStyle? tagSelectedStyle,
    //标签标题
    final TextStyle? tagHeaderStyle,
  }) {
    return GlobalThemeData(
        height: height ?? this.height,
        themeColor: themeColor ?? this.themeColor,
        foodNameFontSize: foodNameFontSize ?? 18,
        foodNameColor: foodNameColor ?? Colors.black,
        foodUnitFontSize: foodDesFontSize ?? 17,
        foodUnitColor: foodDesColor ?? Colors.black,
        foodPriceFontSize: foodPriceFontSize ?? 16,
        foodPriceColor: foodPriceColor ?? Colors.black,
        symbolFontSize: symbolFontSize ?? 14,
        symbolColor: symbolColor ?? Colors.black,
        countFontSize: countFontSize ?? 17,
        countColor: countColor ?? Colors.black,
        visibility: visibility ?? true,
        sectionTitleFontSize: sectionTitleFontSize ?? this.sectionTitleFontSize,
        itemBgSelectColor: itemBgSelectColor ?? this.itemBgSelectColor,
        itemBgNormalColor: itemBgNormalColor ?? this.itemBgNormalColor,
        itemTextSelectColor: itemTextSelectColor ?? this.itemTextSelectColor,
        itemTextNormalColor: itemTextNormalColor ?? this.itemTextNormalColor,
        bottomButtonBgColor: bottomButtonBgColor ?? this.bottomButtonBgColor,
        bottomButtonTitleColor:
            bottomButtonTitleColor ?? this.bottomButtonTitleColor,
        bottomButtonFontSize: bottomButtonFontSize ?? this.bottomButtonFontSize,
        bottomButtonRadius: bottomButtonRadius ?? this.bottomButtonRadius,
        foodOptButtonThemeColor:
            foodOptButtonThemeColor ?? this.foodOptButtonThemeColor,
        foodOptSvgStyle: foodOptSvgStyle ?? 0,
        subFoodImageVisibility:
            subFoodImageVisibility ?? this.subFoodImageVisibility,
        subFoodLayoutMode: subFoodLayoutMode ?? this.subFoodLayoutMode,
        dialogBgImage: dialogBgImage ?? this.dialogBgImage,
        dialogBgColor: dialogBgColor ?? this.dialogBgColor,
        globalBgImageUrl: globalBgImageUrl ?? this.globalBgImageUrl,
        tagNormalStyle: tagNormalStyle ?? this.tagNormalStyle,
        tagSelectedStyle: tagSelectedStyle ?? this.tagSelectedStyle,
        tagHeaderStyle: tagHeaderStyle ?? this.tagHeaderStyle);
  }

  /// Linearly interpolate between two tooltip themes.
  ///
  /// If both arguments are null, then null is returned.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static GlobalThemeData? lerp(
      GlobalThemeData? a, GlobalThemeData? b, double t) {
    if (a == null && b == null) return null;
    assert(t != null);
    return GlobalThemeData(
        height: lerpDouble(a?.height, b?.height, t),
        themeColor: Color.lerp(a?.themeColor, b?.themeColor, t),
        foodNameFontSize:
            lerpDouble(a?.foodUnitFontSize, b?.foodNameFontSize, t),
        foodNameColor: Color.lerp(a?.foodNameColor, b?.foodNameColor, t),
        foodUnitFontSize:
            lerpDouble(a?.foodUnitFontSize, b?.foodUnitFontSize, t),
        foodUnitColor: Color.lerp(a?.foodUnitColor, b?.foodUnitColor, t),
        foodPriceFontSize:
            lerpDouble(a?.foodPriceFontSize, b?.foodPriceFontSize, t),
        foodPriceColor: Color.lerp(a?.foodPriceColor, b?.foodPriceColor, t),
        symbolFontSize: lerpDouble(a?.symbolFontSize, b?.symbolFontSize, t),
        symbolColor: Color.lerp(a?.symbolColor, b?.symbolColor, t),
        countFontSize: lerpDouble(a?.countFontSize, b?.countFontSize, t),
        countColor: Color.lerp(a?.countColor, b?.countColor, t),
        sectionTitleFontSize:
            lerpDouble(a?.sectionTitleFontSize, b?.sectionTitleFontSize, t),
        itemBgSelectColor:
            Color.lerp(a?.itemBgSelectColor, b?.itemBgSelectColor, t),
        itemBgNormalColor:
            Color.lerp(a?.itemBgNormalColor, b?.itemBgNormalColor, t),
        itemTextSelectColor:
            Color.lerp(a?.itemTextSelectColor, b?.itemTextSelectColor, t),
        itemTextNormalColor:
            Color.lerp(a?.itemTextNormalColor, b?.itemTextNormalColor, t),
        bottomButtonBgColor:
            Color.lerp(a?.bottomButtonBgColor, b?.bottomButtonBgColor, t),
        bottomButtonTitleColor:
            Color.lerp(a?.bottomButtonTitleColor, b?.bottomButtonTitleColor, t),
        bottomButtonFontSize:
            lerpDouble(a?.bottomButtonFontSize, b?.bottomButtonFontSize, t),
        bottomButtonRadius:
            lerpDouble(a?.bottomButtonRadius, b?.bottomButtonRadius, t),
        foodOptButtonThemeColor: Color.lerp(
            a?.foodOptButtonThemeColor, b?.foodOptButtonThemeColor, t),
        dialogBgColor: Color.lerp(a?.dialogBgColor, b?.dialogBgColor, t),
        tagNormalStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.black,
            package: 'hot_sport',
            fontFamily: '思源黑体简体'),
        tagSelectedStyle: TextStyle(
            package: 'hot_sport',
            fontWeight: FontWeight.w300,
            fontFamily: '思源黑体简体',
            fontSize: 12,
            color: Color.lerp(a?.themeColor, b?.themeColor, t)),
        tagHeaderStyle: const TextStyle(
            package: 'hot_sport',
            fontWeight: FontWeight.w300,
            fontFamily: '思源黑体简体',
            fontSize: 13,
            color: Colors.black));
  }

  // max object 20
  @override
  int get hashCode => Object.hash(
      height,
      themeColor,
      foodNameFontSize,
      foodNameColor,
      foodUnitFontSize,
      foodUnitColor,
      foodPriceFontSize,
      foodPriceColor,
      symbolFontSize,
      symbolColor,
      countFontSize,
      countColor,
      sectionTitleFontSize,
      itemBgSelectColor,
      itemBgNormalColor,
      itemTextSelectColor,
      itemTextNormalColor,
      bottomButtonBgColor,
      bottomButtonTitleColor,
      globalBgImageUrl);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is GlobalThemeData &&
        other.height == height &&
        other.themeColor == themeColor &&
        other.foodNameFontSize == foodNameFontSize &&
        other.foodNameColor == foodNameColor &&
        other.foodUnitFontSize == foodUnitFontSize &&
        other.foodUnitColor == foodUnitColor &&
        other.foodPriceFontSize == foodPriceFontSize &&
        other.foodPriceColor == foodPriceColor &&
        other.symbolFontSize == symbolFontSize &&
        other.symbolColor == symbolColor &&
        other.countFontSize == countFontSize &&
        other.countColor == countColor &&
        other.visibility == visibility &&
        other.sectionTitleFontSize == sectionTitleFontSize &&
        other.itemBgSelectColor == itemBgSelectColor &&
        other.itemBgNormalColor == itemBgNormalColor &&
        other.itemTextSelectColor == itemTextSelectColor &&
        other.itemTextNormalColor == itemTextNormalColor &&
        other.bottomButtonBgColor == bottomButtonBgColor &&
        other.bottomButtonTitleColor == bottomButtonTitleColor &&
        other.bottomButtonFontSize == bottomButtonFontSize &&
        other.bottomButtonRadius == bottomButtonRadius &&
        other.foodOptButtonThemeColor == foodOptButtonThemeColor &&
        other.foodOptSvgStyle == foodOptSvgStyle &&
        other.subFoodImageVisibility == subFoodImageVisibility &&
        other.subFoodLayoutMode == subFoodLayoutMode &&
        other.dialogBgImage == dialogBgImage &&
        other.dialogBgColor == dialogBgColor &&
        other.globalBgImageUrl == globalBgImageUrl &&
        other.tagNormalStyle == tagNormalStyle &&
        other.tagSelectedStyle == tagSelectedStyle;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('height', height, defaultValue: null));
    properties.add(ColorProperty('themeColor', themeColor, defaultValue: null));
    properties.add(DoubleProperty('foodNameFontSize', foodNameFontSize,
        defaultValue: null));
    properties
        .add(ColorProperty('foodNameColor', foodNameColor, defaultValue: null));
    properties.add(DoubleProperty('foodUnitFontSize', foodUnitFontSize,
        defaultValue: null));
    properties
        .add(ColorProperty('foodUnitColor', foodUnitColor, defaultValue: null));
    properties.add(DoubleProperty('foodPriceFontSize', foodPriceFontSize,
        defaultValue: null));
    properties.add(
        ColorProperty('foodPriceColor', foodPriceColor, defaultValue: null));
    properties.add(
        DoubleProperty('symbolFontSize', symbolFontSize, defaultValue: null));
    properties
        .add(ColorProperty('symbolColor', symbolColor, defaultValue: null));
    properties.add(
        DoubleProperty('countFontSize', countFontSize, defaultValue: null));
    properties.add(ColorProperty('countColor', countColor, defaultValue: null));
    properties.add(FlagProperty('visibility',
        value: visibility, ifTrue: 'true', showName: true));
    properties.add(DoubleProperty('sectionTitleFontSize', sectionTitleFontSize,
        defaultValue: null));
    properties.add(ColorProperty('itemBgSelectColor', itemBgSelectColor,
        defaultValue: null));
    properties.add(ColorProperty('itemBgNormalColor', itemBgNormalColor,
        defaultValue: null));
    properties.add(ColorProperty('itemTextSelectColor', itemTextSelectColor,
        defaultValue: null));
    properties.add(ColorProperty('itemTextNormalColor', itemTextNormalColor,
        defaultValue: null));
    properties.add(ColorProperty('bottomButtonBgColor', bottomButtonBgColor,
        defaultValue: null));
    properties.add(ColorProperty(
        'bottomButtonTitleColor', bottomButtonTitleColor,
        defaultValue: null));
    properties.add(DoubleProperty('bottomButtonFontSize', bottomButtonFontSize,
        defaultValue: null));
    properties.add(DoubleProperty('bottomButtonRadius', bottomButtonRadius,
        defaultValue: null));
    properties.add(ColorProperty(
        'foodOptButtonThemeColor', foodOptButtonThemeColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty<int>('foodOptSvgStyle', foodOptSvgStyle,
        defaultValue: 0));
    properties.add(FlagProperty('subFoodImageVisibility',
        value: subFoodImageVisibility, ifTrue: 'true', showName: true));
    properties.add(EnumProperty('subFoodLayoutMode', subFoodLayoutMode,
        defaultValue: null));
    properties.add(DiagnosticsProperty<Image>('dialogBgImage', dialogBgImage,
        defaultValue: null));
    properties
        .add(ColorProperty('dialogBgColor', dialogBgColor, defaultValue: null));
    properties.add(StringProperty('globalBgImageUrl', globalBgImageUrl,
        defaultValue: null));
    properties.add(ObjectFlagProperty(
        'tagNormalStyle',
        const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.black,
            package: 'hot_sport',
            fontFamily: '思源黑体简体')));
    properties.add(ObjectFlagProperty(
        'tagSelectedStyle',
        TextStyle(
            package: 'hot_sport',
            fontWeight: FontWeight.w300,
            fontFamily: '思源黑体简体',
            fontSize: 12,
            color: themeColor)));
    properties.add(ObjectFlagProperty(
        'tagHeaderStyle',
        const TextStyle(
            package: 'hot_sport',
            fontWeight: FontWeight.w300,
            fontFamily: '思源黑体简体',
            fontSize: 13,
            color: Colors.black)));
  }
}

///  * [TooltipVisibility], which can be used to visually disable descendant [Tooltip]s.
class GlobalTheme extends InheritedTheme {
  /// Creates a tooltip theme that controls the configurations for
  /// [Tooltip].
  ///
  /// The data argument must not be null.
  const GlobalTheme({
    Key? key,
    required this.data,
    required Widget child,
  })  : assert(data != null),
        super(key: key, child: child);

  /// The properties for descendant [Tooltip] widgets.
  final GlobalThemeData data;

  /// Returns the [data] from the closest [TooltipTheme] ancestor. If there is
  /// no ancestor, it returns [ThemeData.tooltipTheme]. Applications can assume
  /// that the returned value will not be null.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// TooltipThemeData theme = TooltipTheme.of(context);
  /// ```
  static GlobalThemeData of(BuildContext context) {
    final GlobalTheme? foodDialogTheme =
        context.dependOnInheritedWidgetOfExactType<GlobalTheme>();
    return foodDialogTheme?.data ?? GlobalThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return GlobalTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(GlobalTheme oldWidget) => data != oldWidget.data;
}

enum SubFoodLayoutMode {
  list,

  flow,
}
