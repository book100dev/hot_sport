import 'package:flutter/material.dart';
import 'package:hot_sport/extension/dashed_border_box.dart';
import 'package:hot_sport/extension/hex_color.dart';
import 'package:hot_sport/hot_sport.dart';

enum BoxBorderType {
  none,
  solidLine, //实线
  dottedLine, //虚线
  dotLine //点线
}

extension ComponetDefuateSize on BoxBorderType {
  _image(ComponetOption? option) {
    if (option?.background?.imageUrl == null) {
      return false;
    } else if (option!.background!.imageUrl.isEmpty) {
      return false;
    }
    return true;
  }

  _color(ComponetOption? option) {
    if (option?.background?.hexColor == null) {
      return false;
    } else if (option!.background!.hexColor.isEmpty) {
      return false;
    }
    return true;
  }

  noneBorder({ComponetOption? option}) => option == null
      ? const BoxDecoration()
      : BoxDecoration(
          color: !_color(option)
              ? Colors.transparent
              : HexColor.fromHex(option.background!.hexColor),
          borderRadius: BorderRadius.all(
              Radius.circular(option.boxDecoration!.borderRadius)),
          image: !_image(option)
              ? null
              : DecorationImage(
                  image: NetworkImage(option.background!.imageUrl)), //边框
        );
//实线
  solidLineLineBorder({ComponetOption? option}) => option == null
      ? const BoxDecoration()
      : BoxDecoration(
          color: !_color(option)
              ? Colors.transparent
              : HexColor.fromHex(option.background!.hexColor),
          image: !_image(option)
              ? null
              : DecorationImage(
                  image: NetworkImage(option.background!.imageUrl)),
          borderRadius: BorderRadius.all(
              Radius.circular(option.boxDecoration!.borderRadius)),
          border: Border.all(
              color: HexColor.fromHex(option.boxDecoration!.hexBorderColor),
              width: option.boxDecoration!.lineWidth), //边框
        );
  //虚线线

  dottedLineBorder({ComponetOption? option}) => option == null
      ? const BoxDecoration()
      : BoxDecoration(
          color: !_color(option)
              ? Colors.transparent
              : HexColor.fromHex(option.background!.hexColor),
          image: !_image(option)
              ? null
              : DecorationImage(
                  image: NetworkImage(option.background!.imageUrl)),
          borderRadius: BorderRadius.all(
              Radius.circular(option.boxDecoration!.borderRadius)),
          border: RDottedLineBorder.all(
              color: HexColor.fromHex(option.boxDecoration!.hexBorderColor),
              width: option.boxDecoration!.lineWidth), //边框
        );
  //点线
  dotLineBorder({ComponetOption? option}) => option == null
      ? const BoxDecoration()
      : BoxDecoration(
          color: !_color(option)
              ? Colors.transparent
              : HexColor.fromHex(option.background!.hexColor),
          image: !_image(option)
              ? null
              : DecorationImage(
                  image: NetworkImage(option.background!.imageUrl)),
          borderRadius: BorderRadius.all(
              Radius.circular(option.boxDecoration!.borderRadius)),
          border: RDottedLineBorder.fromBorderSide(
              BorderSide(
                  color:
                      HexColor.fromHex(option.boxDecoration!.hexBorderColor)),
              dottedLength: 1,
              dottedSpace: 1), //边框
        );
}
