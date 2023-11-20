
part of hot_sport;

class HotSportTable extends HotSportWidget {
  final String content;
  final Function(String content)? callBack;
  const HotSportTable(
      {super.key, super.componetOption, required this.content, this.callBack});

  @override
  double get defaultWidth => ComponetType.table.size.width;

  @override
  double get defaultHight => ComponetType.table.size.height;

  @override
  Widget get snapshot => hotSportInterface.isHotSportBuildersRegistered
      ? SizedBox(
        width: ComponetType.table.size.width,
        height: ComponetType.table.size.height,
        child: const Center(
            child: Icon(Icons.table_rows_outlined)),
      )
      : Center(
          child: ExtendedImage.network(
              'http://via.placeholder.com/${ComponetType.table.size.width}x${ComponetType.table.size.height}')); //Image.asset("assets/images/hotsportsnapshot/text.png");

  @override
  Widget child() => ClipRRect(
      borderRadius: componetOption == null
          ? const BorderRadius.all(Radius.circular(0))
          : BorderRadius.all(
              Radius.circular(componetOption!.boxDecoration!.borderRadius)),
      child: Container(
          //color: hotSportInterface.isHotSportBuildersRegistered ? Colors.white12 : Colors.transparent,
          child: (content.isEmpty
              ? snapshot
              : const Center(child: Text('这是一个列表'),))));
}
