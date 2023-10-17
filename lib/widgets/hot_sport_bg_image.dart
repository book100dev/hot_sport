part of hot_sport;

class HotSportBgImage extends HotSportWidget {
  final String content;
  final Function(String content)? callBack;
  const HotSportBgImage(
      {super.key, super.componetOption, required this.content, this.callBack});

  @override
  double get defaultWidth => ComponetType.bgImage.size.width;

  @override
  double get defaultHight => ComponetType.bgImage.size.height;

  @override
  Widget get snapshot => Center(
      child: ExtendedImage.network(
          'http://via.placeholder.com/${ComponetType.bgImage.size.width}x${ComponetType.bgImage.size.height}')); //Image.asset("assets/images/hotsportsnapshot/text.png");

  @override
  Widget child() => content.isNotEmpty
      ? ExtendedImage.network(
          content,
          fit: BoxFit.fill,
          cache: true,
          border: Border.all(color: Colors.white, width: 1.0),
          shape: BoxShape.rectangle,
        )
      : snapshot;
}
