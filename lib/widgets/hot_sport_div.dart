part of hot_sport;

class HotSportDiv extends HotSportWidget {
  final Widget? box;
  const HotSportDiv({super.key, super.componetOption, this.box});

  @override
  double get defaultWidth => ComponetType.div.size.width;

  @override
  double get defaultHight => ComponetType.div.size.height;

  @override
  // Widget get snapshot => SizedBox(
  //       width: ComponetType.div.size.width,
  //       height: ComponetType.div.size.height,
  //       child: const Center(
  //           child: Icon(Icons.photo_size_select_small_sharp)),
  //     );

  Widget get snapshot => SizedBox(
        width: componetOption == null
            ? ComponetType.div.size.width
            : componetOption!.size!.width,
        height: componetOption == null
            ? ComponetType.div.size.height
            : componetOption!.size!.width,
        child: componetOption == null
            ? const Center(child: Icon(Icons.photo_size_select_small_sharp))
            : Container(),
      );

  @override
  Widget child() => box != null ? Container() : snapshot;
}
