part of hot_sport;

class HotSportShopCart extends HotSportWidget {
  final String content;
  final Function(String content)? callBack;
  const HotSportShopCart(
      {super.key,
      super.componetOption,
      super.customWidget,
      required this.content,
      this.callBack});

  @override
  double get defaultWidth => ComponetType.shopCart.size.width;

  @override
  double get defaultHight => ComponetType.shopCart.size.height;

  @override
  Widget get snapshot => Container(
        color: Colors.black38,
        height: 30,
        child: Image.asset("packages/hot_sport/assets/images/shoppingCart.png"),
      );

  @override
  Widget build(BuildContext context) {
    Alignment ali = alignment(componetOption);
    return Container(
      width:
          componetOption != null ? componetOption?.size?.width : defaultWidth,
      height:
          componetOption != null ? componetOption?.size?.height : defaultHight,
      alignment: ali,
      child: child(),
    );
  }

  @override
  Widget child() => ShopCartWidget(
        componetOption: componetOption,
      );
}

class ShopCartWidget extends StatefulWidget {
  const ShopCartWidget({super.key, this.componetOption});
  final ComponetOption? componetOption;

  @override
  State<ShopCartWidget> createState() => _ShopCartWidgetState();
}

class _ShopCartWidgetState extends State<ShopCartWidget>
    with HotSportWidgetTextMixin {
  final shopCartController = Get.put(ShopCartController());

  // final controller = Get.find<ShopCartController>();
  ComponetOption? get componetOption => widget.componetOption;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
              color: HexColor.fromHex(
                  componetOption?.background?.hexColor ?? '000'),
              width: 2), // 底部边框
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('共计',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: textColor(componetOption),
                    package: 'hot_sport',
                    fontFamily: componetOption?.textStyle?.fontFamily,
                    fontSize: componetOption != null
                        ? componetOption?.textStyle?.fontSize
                        : shopCartController.defaultTextFontSize,
                    fontWeight: fontWeight(componetOption))),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minWidth: 50),
                  child: Obx(() => Text('${shopCartController.price}',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: textColor(componetOption),
                          package: 'hot_sport',
                          fontFamily: componetOption?.textStyle?.fontFamily,
                          fontSize: componetOption != null
                              ? componetOption?.textStyle?.fontSize
                              : shopCartController.defaultTextFontSize,
                          fontWeight: fontWeight(componetOption)))),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('元',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: textColor(componetOption),
                        package: 'hot_sport',
                        fontFamily: componetOption?.textStyle?.fontFamily,
                        fontSize: componetOption != null
                            ? componetOption?.textStyle?.fontSize
                            : shopCartController.defaultTextFontSize,
                        fontWeight: fontWeight(componetOption)))
              ],
            ),
            10.widthBox,
            Obx(() => sbadges.Badge(
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
                  child: SizedBox(
                    width: 55,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: TextButton(
                          onPressed:  hotSportInterface.isHotSportBuildersRegistered
                              ? null
                              : () {
                                  if (componetOption?.event?.actionBlock !=
                                      null) {
                                    componetOption!.event!
                                        .actionBlock!(NavBarAction.shopCart);
                                  }
                                },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor.fromHex(componetOption!
                                          .background!.hexColor.isEmpty
                                      ? '000'
                                      : componetOption!.background!.hexColor)),
                              shape:
                                  MaterialStateProperty.all(const StadiumBorder(
                                      side: BorderSide(
                                //color: Colors.black,
                                style: BorderStyle.none,
                              )))),
                          child: Text(
                            '已选',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                package: 'hot_sport',
                                fontFamily:
                                    componetOption?.textStyle?.fontFamily,
                                fontSize: componetOption != null
                                    ? componetOption?.textStyle?.fontSize
                                    : shopCartController.defaultTextFontSize,
                                fontWeight: fontWeight(componetOption)),
                          )),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
