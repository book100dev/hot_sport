import 'dart:math';

import 'package:flutter/material.dart';


extension HexColor on Color {
  static Color fromHex(String hexString, {double alpha = 1}) {
    if(hexString.isEmpty) {
      return Colors.transparent;
    }
    if (hexString == '#000' || hexString == '000' || hexString == '') {
      // return Colors.transparent;
      return HexColor.fromHex('#000000', alpha: alpha);
    }
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      var hex = int.parse('0x${buffer.toString()}'); //'0xff878787';
      Color aa = Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
          (hex & 0x0000FF) >> 0, alpha);
      return aa;
    } catch (e) {}
    return Colors.transparent;
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      // '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  //获取随机色
  static Color getRandomColor() {
    return Color.fromARGB(
      255,
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
    );
  }
}
