part of hot_sport;

class HotSportShopCartRounded extends HotSportWidget {
  final String content;
  final Function(String content)? callBack;
  const HotSportShopCartRounded(
      {super.key,
      super.componetOption,
      super.customWidget,
      required this.content,
      this.callBack});

  @override
  double get defaultWidth => ComponetType.shopCartRounded.size.width;

  @override
  double get defaultHight => ComponetType.shopCartRounded.size.height;

  @override
  Widget get snapshot => hotSportInterface.isHotSportBuildersRegistered
      ? SizedBox(
          width: ComponetType.shopCartRounded.size.width,
          height: ComponetType.shopCartRounded.size.height,
          child: const Center(child: Icon(Icons.image_outlined)),
        )
      : Center(
          child: ExtendedImage.network(
              'http://via.placeholder.com/${ComponetType.image.size.width}x${ComponetType.image.size.height}')); //Image.asset("assets/images/hotsportsnapshot/text.png");

  @override
  Widget child() => ShopCartWidgetRounded(
        componetOption: componetOption,
      );
}

class ShopCartWidgetRounded extends StatefulWidget {
  const ShopCartWidgetRounded({super.key, this.componetOption});
  final ComponetOption? componetOption;

  @override
  State<ShopCartWidgetRounded> createState() => _ShopCartWidgetRoundedState();
}

class _ShopCartWidgetRoundedState extends State<ShopCartWidgetRounded>
    with HotSportWidgetTextMixin {
  final shopCartController = Get.put(ShopCartController());

  // final controller = Get.find<ShopCartController>();
  ComponetOption? get componetOption => widget.componetOption;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopCartController>(builder: (controller) {
      return FittedBox(
        fit: BoxFit.none,
        child: Container(
          constraints: BoxConstraints(
            minHeight: ComponetType.shopCartRounded.size.height,
            minWidth: ComponetType.shopCartRounded.size.width,
          ),
          width: componetOption?.size?.width ??
              ComponetType.shopCartRounded.size.width,
          height: componetOption?.size?.height ??
              ComponetType.shopCartRounded.size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: hotSportInterface.isHotSportBuildersRegistered
                    ? null
                    : () {
                        if (componetOption?.event?.actionBlock != null) {
                          componetOption!
                              .event!.actionBlock!(NavBarAction.shopCart);
                        }
                      },
                style: ButtonStyle(
                  //  backgroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                        decoration: TextDecoration.none,
                        color: textColor(componetOption),
                        package: 'hot_sport',
                        fontFamily: componetOption?.textStyle?.fontFamily,
                        fontSize: componetOption != null
                            ? componetOption?.textStyle?.fontSize
                            : shopCartController.defaultTextFontSize,
                        fontWeight: fontWeight(componetOption)),
                  ), //字体

                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          componetOption?.boxDecoration?.borderRadius ?? 0),
                      side: const BorderSide(
                          //width: 2,
                          color: Colors.transparent,
                          style: BorderStyle.none),
                    ),
                  ),
                ),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sbadges.Badge(
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
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    componetOption?.textStyle?.fontSize ?? 18)),
                        child: Icon(Icons.shopping_cart,
                            color: HexColor.fromHex(
                                componetOption?.textStyle?.hexColor ??
                                    '333333'),
                            size: componetOption!.textStyle!.fontSize + 10
                            // (20 - componetOption!.textStyle!.fontSize).abs() >=
                            //         componetOption!.textStyle!.fontSize
                            //     ? 20
                            //     : (20 +
                            //         (20 - componetOption!.textStyle!.fontSize)
                            //             .abs())

                            // ((20 + (20 - componetOption!.textStyle!.fontSize).abs()) + 1),
                            ),
                      ),
                      Text(
                        '${shopCartController.price}' '元',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: HexColor.fromHex(
                                componetOption?.textStyle?.hexColor ??
                                    '333333'),
                            package: 'hot_sport',
                            fontFamily: componetOption?.textStyle?.fontFamily,
                            fontSize: componetOption != null
                                ? componetOption?.textStyle?.fontSize
                                : shopCartController.defaultTextFontSize,
                            fontWeight: fontWeight(componetOption)),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: TextButton(
                    onPressed: hotSportInterface.isHotSportBuildersRegistered
                        ? null
                        : () {},
                    child: Text(
                      '已选',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: HexColor.fromHex(
                              componetOption?.textStyle?.hexColor ?? '333333'),
                          package: 'hot_sport',
                          fontFamily: componetOption?.textStyle?.fontFamily,
                          fontSize: componetOption != null
                              ? componetOption?.textStyle?.fontSize
                              : shopCartController.defaultTextFontSize,
                          fontWeight: fontWeight(componetOption)),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
