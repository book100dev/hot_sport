part of hot_sport;

class HotSportSearch extends HotSportWidget {
  final String content;
  const HotSportSearch(
      {super.key, super.componetOption, required this.content});

  @override
  double get defaultWidth => ComponetType.search.size.width;

  @override
  double get defaultHight => ComponetType.search.size.height;

  @override
  Widget get snapshot => Container( 
        height: 26,
        width: 75,
        decoration: BoxDecoration(
          color: HexColor.fromHex('333333'),
          borderRadius: const BorderRadius.all(Radius.circular(13)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            semanticLabel: 'thin',          
            size: 12,
            color: HexColor.fromHex('#999999'),
          ),
          10.widthBox,
          Text(
            '搜索',
            style: SnapshotExt.snapshotTextStyle.copyWith(
                color: HexColor.fromHex(
                  '#999999',
                ),
                fontSize: 10),
          )
        ]),
      );

  @override
  Widget? get faceback => Container(
        height: defaultHight,
        width: defaultWidth,
        decoration: BoxDecoration(
          color: HexColor.fromHex('333333'),
          borderRadius: BorderRadius.all(Radius.circular(defaultHight / 2)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            semanticLabel: 'thin',
            size: 14,
            color: HexColor.fromHex('#999999'),
          ),
          10.widthBox,
          Text(
            '搜索',
            style: SnapshotExt.snapshotTextStyle
                .copyWith(color: HexColor.fromHex('#999999')),
          )
        ]),
      );

  //Image.asset("packages/hot_sport/assets/images/search.png");
  // @override
  // Widget get snapshot => const SizedBox(
  //       width: 110,
  //       height: 40,
  //       child: Align(
  //           alignment: Alignment.center,
  //           child: Text(
  //             '搜索组件',
  //             style: SnapshotExt.snapshotTextStyle,
  //           )),
  //     ); //Image.asset("assets/images/hotsportsnapshot/text.png");

  // @override
  // Widget build(BuildContext context) {
  //   Alignment ali = alignment(componetOption);
  //   return Container(
  //     width:
  //         componetOption != null ? componetOption?.size?.width : defaultWidth,
  //     height:
  //         componetOption != null ? componetOption?.size?.height : defaultHight,
  //     alignment: ali,
  //     child: child(),
  //   );
  // }

  @override
  Widget child() {
    return Container(
      //color: HexColor.fromHex(componetOption?.background?.hexColor ?? 'ffffff'),
      constraints:
          const BoxConstraints(maxWidth: 180, minHeight: 40, maxHeight: 50),
      width:
          componetOption != null ? componetOption?.size?.width : defaultWidth,
      height:
          componetOption != null ? componetOption?.size?.height : defaultHight,
      child: FittedBox(
        fit: BoxFit.none,
        child: OutlinedButton(
          onPressed: hotSportInterface.isHotSportBuildersRegistered
              ? null
              : () {
                  if (componetOption?.event?.actionBlock != null) {
                    componetOption!.event!.actionBlock!(NavBarAction.search);
                  }
                },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 0, color: Colors.transparent),
          ),
          child: componetOption!.size!.width < 80
              ? FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  semanticLabel: 'thin',
                  size: (componetOption != null
                      ? componetOption?.textStyle?.fontSize
                      : defaultTextFontSize + 1 > 36
                          ? 36
                          : componetOption != null
                              ? componetOption?.textStyle?.fontSize
                              : defaultTextFontSize + 1),
                  color: textColor(componetOption),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        semanticLabel: 'thin',
                        size: (componetOption != null
                            ? componetOption?.textStyle?.fontSize
                            : defaultTextFontSize + 1 > 36
                                ? 36
                                : componetOption != null
                                    ? componetOption?.textStyle?.fontSize
                                    : defaultTextFontSize + 1),
                        color: textColor(componetOption),
                      ),
                    ),
                    10.widthBox,
                    Text(
                        content.isEmpty
                            ? ComponetType.search.defaultContent
                            : content,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: textColor(componetOption),
                            fontSize: componetOption != null
                                ? componetOption?.textStyle?.fontSize
                                : defaultTextFontSize,
                            package: 'hot_sport',
                            fontFamily: componetOption?.textStyle?.fontFamily,
                            fontWeight: fontWeight(componetOption)))
                  ],
                ),
        ),
      ),
    );
  }
}
