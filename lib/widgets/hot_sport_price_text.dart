part of hot_sport;

class HotSportPriceText extends HotSportWidget {
  final String content;
  const HotSportPriceText(
      {super.key, super.componetOption, required this.content});

  @override
  double get defaultWidth => ComponetType.foodPrice.size.width;

  @override
  double get defaultHight => ComponetType.foodPrice.size.height;

  @override
  Widget get snapshot => const Center(
      child: Text('常规价格',
          style: SnapshotExt
              .snapshotTextStyle)); //Image.asset("assets/images/hotsportsnapshot/text.png");

  @override
  Widget child() {
    return Text(
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
      textAlign: TextAlign.center,
    );
  }
}
