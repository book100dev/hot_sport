part of hot_sport;

class HotSportImageButton extends HotSportWidget {
  final String content;
  final HotSportButtonCallBack? callBack;

  const HotSportImageButton(
      {super.key, super.componetOption, required this.content, this.callBack});

  @override
  double get defaultWidth => ComponetType.imageButton.size.width;

  @override
  double get defaultHight => ComponetType.imageButton.size.height;

  @override
  Widget get snapshot => const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '图片按钮',
        style: SnapshotExt.snapshotTextStyle,
      ));

  // SizedBox(
  //       width: defaultWidth,
  //       height: defaultHight,
  //       child: const Icon(
  //         Icons.smart_button_rounded,
  //         color: Colors.black,
  //         size: 30,
  //       ),
  //     );
  //Image.asset("assets/images/hotsportsnapshot/button.png");

  @override
  Widget? get faceback => const Icon(
        Icons.image,
        size: 15,
      );

  @override
  Widget child() => ElevatedButton(
      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
      //添加一个点击事件
      onPressed:  hotSportInterface.isHotSportBuildersRegistered
          ? null
          : () {
              if (callBack != null) {
                callBack!();
              }
            },
      // style: ButtonStyle(
      //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
      //       side: BorderSide.none,
      //       borderRadius: BorderRadius.all(Radius.circular(
      //           componetOption == null
      //               ? 0
      //               : componetOption!.boxDecoration!.borderRadius)))),
      // ),
      child: content.isEmpty
          ? const Icon(
              Icons.image,
              size: 15,
            )
          : ExtendedImage.network(
              content,
              fit: BoxFit.fill,
              cache: true,
              shape: BoxShape.rectangle,
            ));
}
