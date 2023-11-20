// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:hot_sport/base/hot_sport_widget.dart';
// import 'package:hot_sport/data/componet_type.dart';
// import 'package:hot_sport/widget_info.dart';

part of hot_sport;

class HotSportFoodImage extends HotSportWidget {
  final String content;
  final Function(String content)? callBack;
  final Function(WidgetInfo widgetInfo)? addWidgetCallBack;
  const HotSportFoodImage(
      {super.key,
      super.componetOption,
      required this.content,
      this.callBack,
      this.addWidgetCallBack});

  @override
  double get defaultWidth => ComponetType.foodImage.size.width;

  @override
  double get defaultHight => ComponetType.foodImage.size.height;

  @override
  Widget get snapshot =>  hotSportInterface.isHotSportBuildersRegistered
      ? const Center(child: Text('菜品图片', style: SnapshotExt.snapshotTextStyle))
      : Center(
          child: ExtendedImage.network(
              'http://via.placeholder.com/${ComponetType.foodImage.size.width}x${ComponetType.foodImage.size.height}'));

  @override
  Widget child() => ClipRRect(
      borderRadius: componetOption == null
          ? const BorderRadius.all(Radius.circular(0))
          : BorderRadius.all(
              Radius.circular(componetOption!.boxDecoration!.borderRadius)),
      child: Container(
          color: content.isEmpty? Colors.white12 : Colors.transparent,
          // hotSportInterface.isHotSportBuildersRegistered ? Colors.white12 : Colors.transparent,
          child: (content.isEmpty
              ? snapshot
              : ExtendedImage.network(
                  content,
                  fit: BoxFit.fill,
                  cache: true,
                  //border: Border.all(color: Colors.white, width: 1.0),
                  shape: BoxShape.rectangle,
                ))));
}
