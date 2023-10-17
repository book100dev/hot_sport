part of hot_sport;

class HotSportVipPriceText extends HotSportWidget {
  final String content;
  const HotSportVipPriceText(
      {super.key, super.componetOption, required this.content});

  @override
  double get defaultWidth => ComponetType.foodVipPrice.size.width;

  @override
  double get defaultHight => ComponetType.foodVipPrice.size.height;

  @override
  Widget get snapshot => const Center(
      child: Text('会员价格',
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
