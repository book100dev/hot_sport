import 'package:flutter/material.dart';
import 'package:hot_sport/data/box_border_type.dart';
// import 'package:hot_sport/extension/hex_color.dart';
import 'package:hot_sport/hot_sport.dart';

mixin HotSportWidgetBoxMixin {
  BoxDecoration? hotSportBoxDecoration(ComponetOption? option) {
    // if (option != null) {
    //   if (option.background!.hexColor.isNotEmpty) {
    //     Color hexColor = HexColor.fromHex(option.background!.hexColor);
    //     return BoxDecoration(color: hexColor);
    //   }
    //   if (option.background!.imageUrl.isNotEmpty) {
    //     return BoxDecoration(
    //       image:
    //           DecorationImage(image: NetworkImage(option.background!.imageUrl)),
    //     );
    //   }
    // }

    if (option == null) {
      return const BoxDecoration(color: Colors.transparent);
    }
    BoxDecoration hotSportBoxDecoration = const BoxDecoration();
    switch (option.boxDecoration?.lineType) {
      case BoxBorderType.none:
        {
          hotSportBoxDecoration =
              option.boxDecoration?.lineType.noneBorder(option: option);
        }
        break;
      case BoxBorderType.solidLine:
        {
          hotSportBoxDecoration = option.boxDecoration?.lineType
              .solidLineLineBorder(option: option);
        }
        break;
      case BoxBorderType.dottedLine:
        {
          hotSportBoxDecoration =
              option.boxDecoration?.lineType.dottedLineBorder(option: option);
        }
        break;
      case BoxBorderType.dotLine:
        {
          hotSportBoxDecoration =
              option.boxDecoration?.lineType.dotLineBorder(option: option);
        }
        break;

      default:
        hotSportBoxDecoration = BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(option.background!.imageUrl)),
        );
    }
    // if (option.background!.imageUrl.isNotEmpty) {
    //   hotSportBoxDecoration.copyWith(
    //       image: NetworkImage(option.background!.imageUrl));
    // }
    return hotSportBoxDecoration;
  }
}
