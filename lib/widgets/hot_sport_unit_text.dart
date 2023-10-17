// import 'package:flutter/material.dart';
// import 'package:hot_sport/base/hot_sport_widget.dart';
// import 'package:hot_sport/data/componet_type.dart';

part of hot_sport;

class HotSportUnitText extends HotSportWidget {
  final String content;
  const HotSportUnitText(
      {super.key, super.componetOption, required this.content});

  @override
  double get defaultWidth => ComponetType.foodUnit.size.width;

  @override
  double get defaultHight => ComponetType.foodUnit.size.height;

  @override
  Widget get snapshot => const Center(
      child: Text('菜品规格',
          style: SnapshotExt
              .snapshotTextStyle)); //Image.asset("assets/images/hotsportsnapshot/text.png");

  @override
  Widget child() {
    return Text(
      content,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: textColor(componetOption),
          fontSize: componetOption != null
              ? componetOption?.textStyle?.fontSize
              : defaultTextFontSize,
          package: 'hot_sport',
          fontFamily: componetOption?.textStyle?.fontFamily,
          fontWeight: fontWeight(componetOption)),
      textAlign: TextAlign.center,
    );
  }
}
