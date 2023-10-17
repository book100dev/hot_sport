// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:hot_sport/base/hot_sport_widget.dart';
// import 'package:hot_sport/data/componet_type.dart';

part of hot_sport;

class HotSportImage extends HotSportWidget {
  final String content;
  final Function(String content)? callBack;
  const HotSportImage(
      {super.key, super.componetOption, required this.content, this.callBack});

  @override
  double get defaultWidth => ComponetType.image.size.width;

  @override
  double get defaultHight => ComponetType.image.size.height;

  @override
  Widget get snapshot =>  hotSportInterface.isHotSportBuildersRegistered
      ? SizedBox(
          width: ComponetType.image.size.width,
          height: ComponetType.image.size.height,
          child: const Center(child: Icon(Icons.image_outlined)),
        )
      : Center(
          child: ExtendedImage.network(
              'http://via.placeholder.com/${ComponetType.image.size.width}x${ComponetType.image.size.height}')); //Image.asset("assets/images/hotsportsnapshot/text.png");

  @override
  Widget child() => ClipRRect(
      borderRadius: componetOption == null
          ? const BorderRadius.all(Radius.circular(0))
          : BorderRadius.all(
              Radius.circular(componetOption!.boxDecoration!.borderRadius)),
      child: Container(
          color: hotSportInterface.isHotSportBuildersRegistered ? Colors.white12 : Colors.transparent,
          child: (content.isEmpty
              ? snapshot
              : ExtendedImage.network(
                  content,
                  fit: BoxFit.fill,
                  cache: true,
                  border: Border.all(color: Colors.white, width: 1.0),
                  shape: BoxShape.rectangle,
                ))));
}
