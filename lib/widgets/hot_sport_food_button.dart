part of hot_sport;

typedef HotSportFoodButtonValueChanged = Function(
    HotSportFoodValue hotSportFoodValue, double foodNumber);

mixin HotSportFoodButtonBean {
  bool showFoodName = true;
  bool showFoodUnit = true;
}
mixin FoodButtonDataStateMixin<T> on HotSportWidgetTextMixin {
  TextStyle _textStyle({ComponetOption? componetOption}) => TextStyle(
      decoration: TextDecoration.none,
      color: textColor(componetOption),
      fontSize: componetOption != null
          ? componetOption.textStyle?.fontSize
          : GlobalTheme.of(Get.context!).foodNameFontSize,
      package: 'hot_sport',
      fontFamily: componetOption?.textStyle?.fontFamily,
      fontWeight: fontWeight(componetOption));

  Widget _replacement(FoodButtonDataState state,
      {ComponetOption? componetOption}) {
    if (state == FoodButtonDataState.waiting) {
      return Container(
          width: 100,
          height: 40,
          alignment: Alignment.center,
          color: Colors.black.withAlpha(20),
          child: 'waiting'
              .text
              .textStyle(_textStyle(componetOption: componetOption))
              .make()
              .shimmer());
    }
    if (state == FoodButtonDataState.soldOut) {
      return '卖完了'
          .text
          .textStyle(_textStyle(componetOption: componetOption))
          .make()
          .shimmer();
    }
    if (state == FoodButtonDataState.sale) {
      return '不可售'
          .text
          .textStyle(_textStyle(componetOption: componetOption))
          .make()
          .shimmer();
    }
    if (state == FoodButtonDataState.noData) {
      return '已下架'
          .text
          .textStyle(_textStyle(componetOption: componetOption))
          .make()
          .shimmer();
    }

    return Container();
  }

  Widget buttonBuilder(
      {required T? food,
      required HotSportFoodController hotSportFoodController,
      FoodViewModelDelegate? delegate,
      ComponetOption? componetOption}) {
    bool isRegister = Get.isRegistered<FoodGetXController>();
    bool assignId = true;
    if (isRegister) {
      FoodGetXController? foodGetXController = Get.find<FoodGetXController>();
      FoodButtonDataState state = foodGetXController.visible(food);
      if (state == FoodButtonDataState.waiting) {
        assignId = false;
      }
    }
    return isRegister
        ? GetBuilder<FoodGetXController>(
            //id: assignId ? food.hashCode.toString() : null,
            id: food.hashCode,
            builder: (controller) {
              FoodButtonDataState state = controller.visible(food);
              bool hide = false;
              if (state == FoodButtonDataState.waiting ||
                  state == FoodButtonDataState.soldOut ||
                  state == FoodButtonDataState.sale ||
                  state == FoodButtonDataState.noData) {
                hide = true;
              }
              return Visibility(
                  visible: !hide,
                  replacement:
                      _replacement(state, componetOption: componetOption),
                  child: CustomAnimatedSwitcher(
                    controller: hotSportFoodController,
                    componetOption: componetOption,
                  ));
            },
          )
        : Visibility(
            visible: true,
            child: CustomAnimatedSwitcher(
              controller: hotSportFoodController,
              componetOption: componetOption,
            ));
  }
}

enum HotSportButtonType {
  food1,
  food2,
  food3,
  food4,
  food5,
}

class HotSportFoodButton<T> extends HotSportWidget {
  final HotSportButtonType type;
  final T? food;
  const HotSportFoodButton(this.type, this.food,
      {super.key, super.componetOption});

  Widget _snapshot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('菜品'),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleMinus,
                  color: HexColor.fromHex('#333333'),
                  size: 20,
                ),
                30.widthBox,
                FaIcon(
                  FontAwesomeIcons.circlePlus,
                  color: HexColor.fromHex('#333333'),
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  double get defaultWidth => ComponetType.food1.size.width;

  @override
  double get defaultHight => ComponetType.food1.size.height;

  @override
  Widget get snapshot => _snapshot();
  @override
  Widget child() => GlobalTheme(
      data: hotSportInterface.globalThemeData() ?? const GlobalThemeData(),
      child: FoodButton(
        type: this.type,
        componetOption: componetOption,
        food: this.food,
      ));
}

class FoodButton<T> extends StatefulWidget {
  const FoodButton({
    Key? key,
    required this.type,
    this.componetOption,
    this.food,
  }) : super(key: key);
  final HotSportButtonType type;
  final ComponetOption? componetOption;
  final T? food;
  @override
  State<FoodButton> createState() => _FoodButtonState();
}

class _FoodButtonState extends State<FoodButton>
    with
        HotSportFoodButtonBean,
        HotSportWidgetTextMixin,
        FoodButtonDataStateMixin,
        FoodViewModelDelegate {
  late HotSportFoodController hotSportFoodController;
  @override
  bool get showFoodName {
    if (widget.componetOption == null) {
      return false;
    }
    return !widget.componetOption!.foodModelProperty!.showFoodName;
  }

  @override
  bool get showFoodUnit {
    if (widget.componetOption == null) {
      return false;
    }
    return !widget.componetOption!.foodModelProperty!.showFoodUnit;
  }

  String get foodName => jsonConvert.content(
      food: widget.food, componetType: ComponetType.foodName);
  String get foodUnit => jsonConvert.content(
      food: widget.food, componetType: ComponetType.foodUnit);
  String get foodPrice => jsonConvert.content(
      food: widget.food, componetType: ComponetType.foodPrice);
  String get foodVipPrice => jsonConvert.content(
      food: widget.food, componetType: ComponetType.foodVipPrice);

  bool get isRegister => Get.isRegistered<FoodGetXController>();

  FoodGetXController? get foodGetXController =>
      isRegister ? Get.find<FoodGetXController>() : null;

  dynamic foodViewModel;

  @override
  void dispose() {
    super.dispose();
    bool isRegister = Get.isRegistered<FoodGetXController>();
    FoodGetXController? foodGetXController =
        isRegister ? Get.find<FoodGetXController>() : null;
    if (foodGetXController?.hotSportControllers == null) {
      return;
    }
    if (foodGetXController!.hotSportControllers
        .contains(hotSportFoodController)) {}
    foodGetXController.hotSportControllers.remove(hotSportFoodController);
  }

  @override
  void initState() {
    super.initState();
    //var fontLoader = FontLoader('FenPinYinTi2');
    hotSportFoodController = HotSportFoodController(food: widget.food);
    hotSportFoodController.delegate = this;
    if (foodGetXController != null) {
      hotSportFoodController.foodNumber =
          foodGetXController!.initFoodNumber(widget.food);
      hotSportFoodController.minNumber =
          foodGetXController!.delegate?.minFoodNumber(food: widget.food) ?? 1;
      hotSportFoodController.maxNumber =
          foodGetXController!.delegate?.maxFoodNumber(food: widget.food) ??
              9999;
      foodGetXController?.hotSportControllers.add(hotSportFoodController);
    }
  }

  _bText(String foodName, ComponetOption? componetOption) => Text(foodName,
      textAlign: TextAlign.right,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: textColor(componetOption),
          fontSize: componetOption != null
              ? componetOption.textStyle?.fontSize
              : GlobalTheme.of(context).foodNameFontSize,
          package: 'hot_sport',
          fontFamily: componetOption?.textStyle?.fontFamily,
          fontWeight: fontWeight(componetOption)));

  _bPriceInfo(
          String foodPrice, String foodUnit, ComponetOption? componetOption) =>
      Container(
          key: UniqueKey(),
          //width: 100,
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: "￥",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: textColor(componetOption),
                      fontSize: (componetOption != null
                              ? componetOption.textStyle?.fontSize
                              : GlobalTheme.of(context).foodNameFontSize)! -
                          4,
                      package: 'hot_sport',
                      fontFamily: componetOption?.textStyle?.fontFamily,
                      fontWeight: fontWeight(componetOption))),
              TextSpan(
                  text: foodPrice,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: textColor(componetOption),
                      fontSize: (componetOption != null
                              ? componetOption.textStyle?.fontSize
                              : GlobalTheme.of(context).foodNameFontSize)! -
                          2,
                      package: 'hot_sport',
                      fontFamily: componetOption?.textStyle?.fontFamily,
                      fontWeight: fontWeight(componetOption))),
              TextSpan(
                  text: "/$foodUnit",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: textColor(componetOption),
                      fontSize: (componetOption != null
                              ? componetOption.textStyle?.fontSize
                              : GlobalTheme.of(context).foodNameFontSize)! -
                          2,
                      package: 'hot_sport',
                      fontFamily: componetOption?.textStyle?.fontFamily,
                      fontWeight: fontWeight(componetOption))),
            ]),
            textAlign: TextAlign.justify,
          ));

  @override
  Widget build(BuildContext context) {
    late Widget child;
    double fSize = widget.componetOption == null
        ? 20
        : widget.componetOption!.textStyle!.fontSize;
    switch (widget.type) {
      case HotSportButtonType.food1:
        {
          child = LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxHeight < 50) {
              widget.componetOption?.size?.height = 50;
            }
            if (alignment(widget.componetOption) == Alignment.centerLeft) {
              return child = Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Offstage(
                          offstage: showFoodName,
                          child: _bText(foodName, widget.componetOption),
                        ),
                        Offstage(
                            offstage: showFoodUnit,
                            child: _bPriceInfo(
                                foodPrice, foodUnit, widget.componetOption)),
                      ],
                    ),
                    buttonBuilder(
                        food: widget.food,
                        delegate: this,
                        hotSportFoodController: hotSportFoodController,
                        componetOption: widget.componetOption)
                  ],
                ),
              );
            }
            if (alignment(widget.componetOption) == Alignment.centerRight) {
              return child = Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Offstage(
                      offstage: showFoodName,
                      child: _bText(foodName, widget.componetOption),
                    ),
                    Row(
                      children: [
                        Offstage(
                            offstage: showFoodUnit,
                            child: _bPriceInfo(
                                foodPrice, foodUnit, widget.componetOption)),
                        buttonBuilder(
                            food: widget.food,
                            delegate: this,
                            hotSportFoodController: hotSportFoodController,
                            componetOption: widget.componetOption)
                      ],
                    ),
                  ],
                ),
              );
            }
            return child = Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Offstage(
                    offstage: showFoodName,
                    child: _bText(foodName, widget.componetOption),
                  ),
                  Offstage(
                      offstage: showFoodUnit,
                      child: _bPriceInfo(
                          foodPrice, foodUnit, widget.componetOption)),
                  buttonBuilder(
                      food: widget.food,
                      delegate: this,
                      hotSportFoodController: hotSportFoodController,
                      componetOption: widget.componetOption)
                ],
              ),
            );
          });
        }
        break;

      case HotSportButtonType.food2:
        {
          child = Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, //可配置spaceBetween 和  spaceAround
              children: [
                Offstage(
                    offstage: showFoodName,
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        alignment: alignment(widget.componetOption),
                        width: double.infinity,
                        // height: 40,
                        child: _bText(foodName, widget.componetOption))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Offstage(
                        offstage: showFoodUnit,
                        child: _bPriceInfo(
                            foodPrice, foodUnit, widget.componetOption)),
                    Container(
                      constraints: const BoxConstraints(minHeight: 60),
                      child: buttonBuilder(
                          food: widget.food,
                          delegate: this,
                          hotSportFoodController: hotSportFoodController,
                          componetOption: widget.componetOption),
                    ),
                  ],
                )
              ],
            ),
          );
        }
        break;

      case HotSportButtonType.food3:
        {
          // double baseFoodHeight = fSize + 3;
          child = Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, //可配置spaceBetween 和  spaceAround
              children: [
                Offstage(
                    offstage: showFoodName,
                    child: Container(
                      // color: Colors.red,
                      alignment: alignment(widget.componetOption),
                      width: 80,
                      // height:
                      //     baseFoodHeight * (fSize / 18) * foodName.length * 1.8,
                      child: SizedBox(
                        width: 20,
                        child: _bText(foodName, widget.componetOption),
                      ),
                    )),
                Offstage(
                    offstage: showFoodUnit,
                    child: _bPriceInfo(
                        foodPrice, foodUnit, widget.componetOption)),
                Container(
                    constraints: const BoxConstraints(minHeight: 60),
                    child: buttonBuilder(
                        food: widget.food,
                        delegate: this,
                        hotSportFoodController: hotSportFoodController,
                        componetOption: widget.componetOption)),
              ],
            ),
          );
        }
        break;
      case HotSportButtonType.food4:
        {
          child = Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, //可配置spaceBetween 和  spaceAround
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Offstage(
                    offstage: showFoodName,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: alignment(widget.componetOption),
                      width: double.infinity,
                      child: _bText(foodName, widget.componetOption),
                    )),
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Offstage(
                          offstage: showFoodUnit,
                          child: _bPriceInfo(
                              foodPrice, foodUnit, widget.componetOption)),
                      Container(
                        constraints: const BoxConstraints(minHeight: 60),
                        child: buttonBuilder(
                            food: widget.food,
                            delegate: this,
                            hotSportFoodController: hotSportFoodController,
                            componetOption: widget.componetOption),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
        break;
      case HotSportButtonType.food5:
        {
          child = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Offstage(
                        offstage: showFoodName,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.centerLeft,
                          child: _bText(foodName, widget.componetOption),
                        )),
                    Container(
                      constraints: const BoxConstraints(minHeight: 60),
                      child: buttonBuilder(
                          food: widget.food,
                          delegate: this,
                          hotSportFoodController: hotSportFoodController,
                          componetOption: widget.componetOption),
                    ),
                  ],
                ),
                Offstage(
                    offstage: showFoodUnit,
                    child: Row(
                      mainAxisAlignment:
                          rowMainAxisAlignment(widget.componetOption),
                      children: [
                        _bPriceInfo(foodPrice, foodUnit, widget.componetOption)
                      ],
                    ))
              ],
            ),
          );
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
    return child;
  }

  @override
  HotSportFoodValue get hotSportFoodValue => hotSportFoodController.value;

  @override
  void userUpdateHotSportFoodValue(HotSportFoodValue value, double foodNumber) {
    if (foodGetXController?.hotSportFoodButtonValueChanged != null) {
      foodGetXController?.hotSportFoodButtonValueChanged!(
          value, foodNumber, foodViewModel);
    }
  }

  @override
  bool userWillShouldUpdateWithFoodValue(HotSportFoodValue value,
      {required bool condition}) {
    if (foodGetXController?.hotSportFoodValueCanChanged != null) {
      return foodGetXController!.hotSportFoodValueCanChanged!(value,
          (viewModel) {
        print('回调了');
        foodViewModel = viewModel;
      }, condition);
    }
    return true;
  }

  @override
  void hotSportButtonAdd(HotSportFoodValue value, double foodNumber) {
    if (foodGetXController?.hotSportFoodButtonAdd != null) {
      foodGetXController?.hotSportFoodButtonAdd!(
          value, foodNumber, foodViewModel);
    }
  }

  @override
  void hotSportButtonReduce(HotSportFoodValue value, double foodNumber) {
    if (foodGetXController?.hotSportFoodButtonReduce != null) {
      foodGetXController?.hotSportFoodButtonReduce!(
          value, foodNumber, foodViewModel);
    }
  }

  @override
  void hotSportButtonInputChanged(HotSportFoodValue value, double foodNumber) {
    if (foodGetXController?.hotSportFoodButtonInputValueChanged != null) {
      userWillShouldUpdateWithFoodValue(value, condition: true);
      foodGetXController?.hotSportFoodButtonInputValueChanged!(
          value, foodNumber, foodViewModel);
    }
  }
}

class CustomAnimatedSwitcher extends StatefulWidget {
  const CustomAnimatedSwitcher(
      {super.key, required this.controller, this.componetOption});
  final HotSportFoodController controller;
  final ComponetOption? componetOption;

  @override
  State<CustomAnimatedSwitcher> createState() => _CustomAnimatedSwitcherState();
}

class _CustomAnimatedSwitcherState extends State<CustomAnimatedSwitcher>
    with HotSportWidgetTextMixin {
  @override
  void initState() {
    super.initState();
    //...
  }

  @override
  void dispose() {
    super.dispose();
    //
  }

  void _add() {
    if ((widget.controller.count.value + 1) >= widget.controller.maxNumber) {
      widget.controller.count.value = widget.controller.maxNumber;
      return;
    }
    if (widget.controller.value.food != null) {
      if (widget.controller.canAdd) {
        widget.controller.addFood();
      }
      return;
    }
    widget.controller.addFood();
  }

  void _inputChange() {
    widget.controller.changeFood();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      ///数据发生变化时回调
      builder: (context, value, child) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
            alignment: Alignment.center,
            child: IntrinsicWidth(
              child: widget.controller.count.value == 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          constraints: const BoxConstraints(
                            minWidth: 45,
                            minHeight: 45,
                          ),
                          child: _buildAddBtn(context),
                        )),
                        40.widthBox,
                        Expanded(
                          child: Container(
                            width: 45,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                constraints: const BoxConstraints(
                                  minWidth: 45,
                                  minHeight: 45,
                                ),

                                //height: 45,
                                child: _buildMinusBtn(context))),
                        Container(
                            constraints: const BoxConstraints(
                                minWidth: 40, maxWidth: 100),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: hotSportInterface
                                          .isHotSportBuildersRegistered
                                      ? null
                                      : () {
                                          print('弹框确认数量');
                                          _inputChange();
                                        },
                                  child: _buildAnimatedSwitcher(context)),
                            )),
                        Expanded(
                          child: Container(
                              constraints: const BoxConstraints(
                                minWidth: 45,
                                minHeight: 45,
                              ),
                              child: _buildAddBtn(context)),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },

      ///监听的数据
      valueListenable: widget.controller.count,
    );
  }

  int get iconStyle {
    int? style = GlobalTheme.of(context).foodOptSvgStyle;
    if (widget.componetOption?.foodModelProperty?.iconStyle != null) {
      return widget.componetOption?.foodModelProperty?.iconStyle ?? 0;
    }
    return style ?? 0;
  }

  Color get iconColor {
    Color? color = GlobalTheme.of(context).foodOptButtonThemeColor;
    if (widget.componetOption?.foodModelProperty?.iconColor != null) {
      return HexColor.fromHex(
          widget.componetOption?.foodModelProperty?.iconColor ?? '8b0000');
    }
    return color ?? HexColor.fromHex('8b0000');
  }

  double get foodNumber => widget.controller.number;
  Widget _buildAnimatedSwitcher(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(
                scale: animation,
                child: RotationTransition(turns: animation, child: child)),
        child: Visibility(
          visible: foodNumber == 0 ? false : true,
          replacement: const SizedBox(width: 0, height: 32),
          child: Text(
            Decimal.parse('$foodNumber').toString(),
            key: ValueKey<double>(foodNumber),
            style: TextStyle(
                decoration: TextDecoration.none,
                color: textColor(widget.componetOption),
                fontSize: (widget.componetOption != null
                        ? widget.componetOption!.textStyle!.fontSize - 1
                        : GlobalTheme.of(context).foodNameFontSize)! -
                    1,
                package: 'hot_sport',
                fontFamily: widget.componetOption?.textStyle?.fontFamily,
                fontWeight: fontWeight(widget.componetOption)),
          ),
        ),
      );

  Widget _buildMinusBtn(BuildContext context) {
    return Visibility(
      visible: widget.controller.count.value == 0 ? false : true,
      replacement: const SizedBox(width: 32, height: 32),
      child: Center(
        child: SizedBox(
          //width: 32,
          child: IconButton(
              padding: const EdgeInsets.all(0),
              //elevation: 3,
              icon: FaIcon(
                iconStyle == 0
                    ? FontAwesomeIcons.circleMinus
                    : FontAwesomeIcons.squareMinus,
                size: widget.componetOption == null
                    ? 32
                    : widget.componetOption!.textStyle!.fontSize.clamp(32, 45),
                // (widget.componetOption!.textStyle!.fontSize > 20
                //     ? widget.componetOption!.textStyle!.fontSize + 5
                //     : 35),
                color: iconColor,
              ),
              onPressed: () {
                if ((widget.controller.count.value - 1) <
                    widget.controller.minNumber) {
                  widget.controller.reduceFood(remove: true);
                  return;
                }
                if (widget.controller.count.value <= 0) {
                  return;
                }
                widget.controller.reduceFood();
              }),
        ),
      ),
    );
  }

  Widget _buildAddBtn(BuildContext context) => Center(
        child: SizedBox(
          //width: 32,
          child: IconButton(
              padding: const EdgeInsets.all(0),
              //elevation: 3,
              icon: FaIcon(
                iconStyle == 0
                    ? FontAwesomeIcons.circlePlus
                    : FontAwesomeIcons.squarePlus,
                size: widget.componetOption == null
                    ? 32
                    : widget.componetOption!.textStyle!.fontSize.clamp(32, 45),
                // (widget.componetOption!.textStyle!.fontSize > 20
                //     ? widget.componetOption!.textStyle!.fontSize.clamp(35,45)
                //     : 35),
                color: iconColor,
              ),
              onPressed: () => _add()),
        ),
      );
}
