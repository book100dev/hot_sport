// import 'package:flutter/material.dart';
// import 'package:hot_sport/base/hot_sport_widget.dart';
// import 'package:hot_sport/data/componet_type.dart';
part of hot_sport;

typedef HotSportButtonCallBack = Function();

class HotSportButton extends HotSportWidget {
  final String content;
  final HotSportButtonCallBack? callBack;

  const HotSportButton(
      {super.key, super.componetOption, required this.content, this.callBack});

  @override
  double get defaultWidth => ComponetType.button.size.width;

  @override
  double get defaultHight => ComponetType.button.size.height;

  @override
  Widget get snapshot => const Center(
          child: Text(
        '按钮',
        style: SnapshotExt.snapshotTextStyle,
      ));

  // @override
  // Widget get faceback => Center(
  //       child: TextButton(
  //           onPressed: () {},
  //           style: OutlinedButton.styleFrom(
  //             fixedSize: Size(defaultWidth, defaultHight),
  //             backgroundColor: const Color.fromARGB(255, 211, 223, 244),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(8),
  //             ),
  //           ),
  //           child: Text(
  //             '保存',
  //             style:
  //                 SnapshotExt.snapshotTextStyle.copyWith(color: Colors.white),
  //           )),
  //     );

  @override
  Widget child() => Container(
      padding: const EdgeInsets.all(0),
      child: Center(
        child: TextButton(
          //添加一个点击事件
          onPressed: hotSportInterface.isHotSportBuildersRegistered
              ? null
              : () {
                  if (componetOption?.event?.actionBlock != null) {
                    componetOption!.event!.actionBlock!(NavBarAction.button);
                  }
                  // if (callBack != null) {
                  //   callBack!();
                  // }
                },
          child: Text(
            content,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: textColor(componetOption),
                package: 'hot_sport',
                fontFamily: componetOption?.textStyle?.fontFamily,
                fontSize: componetOption != null
                    ? componetOption?.textStyle?.fontSize
                    : defaultTextFontSize,
                fontWeight: fontWeight(componetOption)),
            // textAlign: textAlign,
          ),
        ),
      ));
}
