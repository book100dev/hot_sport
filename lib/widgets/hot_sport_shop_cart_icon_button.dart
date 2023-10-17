part of hot_sport;

class HotSportShopCartIconButton extends HotSportWidget {
  final String content;
  final Function(String content)? callBack;
  const HotSportShopCartIconButton(
      {super.key,
      super.componetOption,
      super.customWidget,
      required this.content,
      this.callBack});

  @override
  double get defaultWidth => ComponetType.shopCartIconButton.size.width;

  @override
  double get defaultHight => ComponetType.shopCartIconButton.size.height;

  @override
  Widget get snapshot => SizedBox(
        height: 30,
        child: Image.asset(
            "packages/hot_sport/assets/images/shoppingCartIconButton.png"),
      );

  @override
  double get facebackWidth => 90;

  @override
  double get facebackHight => 30;

  @override
  Widget? get faceback => SizedBox(
        height: facebackHight,
        width: facebackWidth,
        child: Center(
          child: Image.asset(
              "packages/hot_sport/assets/images/shoppingCartIconButton.png"),
        ),
      );

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
  Widget child() => HotSportShopCartIconButtonWidget(
        componetOption: componetOption,
        superWodget: this,
      );
}

class HotSportShopCartIconButtonWidget extends StatefulWidget {
  const HotSportShopCartIconButtonWidget(
      {super.key, this.componetOption, required this.superWodget});
  final ComponetOption? componetOption;
  final HotSportShopCartIconButton superWodget;

  @override
  State<HotSportShopCartIconButtonWidget> createState() =>
      _HotSportShopCartIconButtonWidgetState();
}

class _HotSportShopCartIconButtonWidgetState
    extends State<HotSportShopCartIconButtonWidget>
    with HotSportWidgetTextMixin {
  final shopCartController = Get.put(ShopCartController());

  ComponetOption? get componetOption => widget.componetOption;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints(maxWidth: 180, minHeight: 40, maxHeight: 50),
      width: componetOption != null
          ? componetOption?.size?.width
          : widget.superWodget.defaultWidth,
      height: componetOption != null
          ? componetOption?.size?.height
          : widget.superWodget.defaultHight,
      child: FittedBox(
          fit: BoxFit.none,
          child: Obx(
            () => sbadges.Badge(
              showBadge: shopCartController.count.value != 0,
              badgeStyle: sbadges.BadgeStyle(
                shape: sbadges.BadgeShape.circle,
                borderRadius: BorderRadius.circular(5),
                padding: const EdgeInsets.all(5),
                badgeGradient: const sbadges.BadgeGradient.linear(
                  colors: [
                    Colors.red,
                    Colors.redAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              badgeContent: Text(shopCartController.count.toString(),
                  style: const TextStyle(color: Colors.white)),
              child: OutlinedButton(
                onPressed: hotSportInterface.isHotSportBuildersRegistered
                    ? null
                    : () {
                        if (componetOption?.event?.actionBlock != null) {
                          componetOption!
                              .event!.actionBlock!(NavBarAction.shopCart);
                        }
                      },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 0, color: Colors.transparent),
                ),
                child: componetOption!.size!.width < 80
                    ? FaIcon(
                        FontAwesomeIcons.cartShopping,
                        semanticLabel: 'thin',
                        size: (componetOption != null
                            ? componetOption?.textStyle?.fontSize
                            : widget.superWodget.defaultTextFontSize + 2 > 36
                                ? 36
                                : componetOption != null
                                    ? componetOption?.textStyle?.fontSize
                                    : widget.superWodget.defaultTextFontSize +
                                        2),
                        color: textColor(componetOption),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: FaIcon(
                              FontAwesomeIcons.cartShopping,
                              semanticLabel: 'thin',
                              size: (componetOption != null
                                  ? componetOption?.textStyle?.fontSize
                                  : widget.superWodget.defaultTextFontSize + 2 >
                                          36
                                      ? 36
                                      : componetOption != null
                                          ? componetOption?.textStyle?.fontSize
                                          : widget.superWodget
                                                  .defaultTextFontSize +
                                              2),
                              color: textColor(componetOption),
                            ),
                          ),
                          10.widthBox,
                          Text(
                              widget.superWodget.content.isEmpty
                                  ? ComponetType
                                      .shopCartIconButton.defaultContent
                                  : widget.superWodget.content,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: textColor(componetOption),
                                  fontSize: componetOption != null
                                      ? componetOption?.textStyle?.fontSize
                                      : widget.superWodget.defaultTextFontSize,
                                  package: 'hot_sport',
                                  fontFamily:
                                      componetOption?.textStyle?.fontFamily,
                                  fontWeight: fontWeight(componetOption)))
                        ],
                      ),
              ),
            ),
          )),
    );
  }
}
