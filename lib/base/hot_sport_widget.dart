// import 'package:flutter/material.dart';
// import 'package:hot_sport/hot_sport.dart';
// import 'package:hot_sport/mixin/hot_sport_widget_box_mixin.dart';
// import 'package:hot_sport/mixin/hot_sport_widget_text_mixin.dart';

part of hot_sport;

abstract class BoxView {
  Widget child();
  double get defaultWidth;
  double get defaultHight;
  double get facebackWidth;
  double get facebackHight;
  Widget? get snapshot;
  Widget? get faceback;
}

class HotSportWidget extends StatelessWidget
    with HotSportWidgetTextMixin, HotSportWidgetBoxMixin
    implements BoxView {
  // const HotSportWidget({super.key, this.componetOption, this.widgetInfo});

  const HotSportWidget({super.key, this.componetOption, this.customWidget});

  final String defaultBgImageUrl = '';
  final double defaultTextFontSize = 13;
  final double defaultFoodNameFontSize = 18;
  final String defaultBgHexColor = 'ffffff';

  final ComponetOption? componetOption;

  final Widget? customWidget;

  // final WidgetInfo? widgetInfo;

  //bool get isFood => ComponetType.isFood(widgetInfo!.componentName);
  @override
  Widget build(BuildContext context) {
    Alignment ali = alignment(componetOption);
    // if (widgetInfo == null) {
    // } else if (isFood) {
    //   ali = Alignment.center;
    // }
    return Container(
      width:
          componetOption != null ? componetOption?.size?.width : defaultWidth,
      height:
          componetOption != null ? componetOption?.size?.height : defaultHight,
      alignment: ali,
      decoration: hotSportBoxDecoration(componetOption),
      child: child(),
    );
  }

  @override
  Widget child() => Container();

  @override
  double get defaultWidth => 82;

  @override
  double get defaultHight => 54;

  @override
  Widget? get snapshot => Container();

  @override
  Widget? get faceback => snapshot;
  
  @override
  double get facebackWidth => defaultWidth;
  
  @override
  double get facebackHight => defaultHight;
}
