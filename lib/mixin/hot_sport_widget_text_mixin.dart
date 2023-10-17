import 'package:flutter/material.dart';
import 'package:hot_sport/extension/hex_color.dart';
import 'package:hot_sport/hot_sport.dart';

mixin HotSportWidgetTextMixin {
  //文本对其
  TextAlign textAlign(ComponetOption? option) {
    if (option?.textStyle?.align == "left") {
      return TextAlign.left;
    } else if (option?.textStyle?.align == "center") {
      return TextAlign.center;
    } else if (option?.textStyle?.align == "right") {
      return TextAlign.right;
    } else if (option?.textStyle?.align == "justify") {
      return TextAlign.justify;
    }
    return TextAlign.center;
  }

//Container 对齐
  Alignment alignment(ComponetOption? option) {
    if (option?.textStyle?.align == "left") {
      return Alignment.centerLeft;
    } else if (option?.textStyle?.align == "center") {
      return Alignment.center;
    } else if (option?.textStyle?.align == "right") {
      return Alignment.centerRight;
    } else if (option?.textStyle?.align == "justify") {
      return Alignment.center;
    }
    return Alignment.center;
  }

  MainAxisAlignment rowMainAxisAlignment(ComponetOption? option) {
    if (option?.textStyle?.align == "left") {
      return MainAxisAlignment.start;
    } else if (option?.textStyle?.align == "center") {
      return MainAxisAlignment.center;
    } else if (option?.textStyle?.align == "right") {
      return MainAxisAlignment.end;
    } else if (option?.textStyle?.align == "justify") {
      return MainAxisAlignment.center;
    }
    return MainAxisAlignment.center;
  }

  //FontWeight
  FontWeight fontWeight(ComponetOption? option) {
    if (option == null) return FontWeight.normal;
    if (option.textStyle?.fontWeight == null) {
      print('这个di空了');
    }
    if (option.textStyle?.fontWeight == 'Normal') {
      return FontWeight.normal;
    } else if (option.textStyle?.fontWeight == 'Bold') {
      return FontWeight.bold;
    } else if (option.textStyle!.fontWeight.startsWith('w2')) {
      return FontWeight.w200;
    } else if (option.textStyle!.fontWeight.startsWith('w3')) {
      return FontWeight.w300;
    } else if (option.textStyle!.fontWeight.startsWith('w4')) {
      return FontWeight.w400;
    } else if (option.textStyle!.fontWeight.startsWith('w5')) {
      return FontWeight.w500;
    } else if (option.textStyle!.fontWeight.startsWith('w6')) {
      return FontWeight.w600;
    } else if (option.textStyle!.fontWeight.startsWith('w7')) {
      return FontWeight.w700;
    } else if (option.textStyle!.fontWeight.startsWith('w8')) {
      return FontWeight.w800;
    } else if (option.textStyle!.fontWeight.startsWith('w9')) {
      return FontWeight.w900;
    }
    return FontWeight.normal;
  }

  //textColor
  Color textColor(ComponetOption? option) => option == null
      ? Colors.black
      : option.textStyle!.hexColor.isEmpty
          ? Colors.black
          : HexColor.fromHex(option.textStyle!.hexColor);
}
