part of hot_sport;

typedef WidgetInfoBuilder = Widget Function(
    BuildContext context, WidgetInfo widgetInfo);

class WidgetInfo implements BaseComponetBean {
  late String componentTag;
  late String componentName;
  late String componentId;
  late String content;
  dynamic food;
  String? description;
  Widget? customWidget;
  WidgetInfoBuilder? widgetBuilder;
  Function(WidgetInfo widgetInfo)? callBack;
  // String _content() {
  //   if (this.content == null) {
  //     return '';
  //   }
  //   return content!;
  // }

  WidgetInfo(
      {required this.componentTag,
      required this.componentName,
      required this.componentId,
      required this.content,
      this.food,
      this.customWidget,
      this.widgetBuilder,
      this.description,
      this.callBack}) {
    if (content.isEmpty) {
      content = '';
    }
    hotSportWidget = child(_option);
  }

  ComponetType get componetType => ComponetType.values
      .firstWhere((element) => element.value == componentName);

  ComponetOption? _option;
  set option(ComponetOption? option) {
    _option = option;
  }

  ComponetOption? get option => _option;

  HotSportWidget? hotSportWidget;
  dynamic _lastFood;
  HotSportWidget child(ComponetOption? option) {
    if (_lastFood != food) {
      if (kDebugMode) {
        print('不一样le');
      }
    }
    _lastFood = food;
    _option = option;

    if (componentName == ComponetType.text.value) {
      hotSportWidget = HotSportText(componetOption: option, content: content);
    } else if (componentName == ComponetType.writeText.value) {
      hotSportWidget =
          HotSportWriteText(componetOption: option, content: content);
    } else if (componentName == ComponetType.foodName.value) {
      hotSportWidget =
          HotSportFoodNameText(componetOption: option, content: content);
    } else if (componentName == ComponetType.foodUnit.value) {
      hotSportWidget =
          HotSportUnitText(componetOption: option, content: content);
    } else if (componentName == ComponetType.foodPrice.value) {
      hotSportWidget =
          HotSportPriceText(componetOption: option, content: content);
    } else if (componentName == ComponetType.foodVipPrice.value) {
      hotSportWidget =
          HotSportVipPriceText(componetOption: option, content: content);
    } else if (componentName == ComponetType.button.value) {
      hotSportWidget = HotSportButton(
          componetOption: option,
          content: content,
          // callBack: () {
          //   if (this.option?.event?.event != null) {
          //     //hotSportInterface.hotSportAction(this, this.option!.event!.event!);
          //   }
          //   if (callBack != null) {
          //     callBack!(this);
          //   }
          // }
          );
    } else if (componentName == ComponetType.imageButton.value) {
      hotSportWidget = HotSportImageButton(
          componetOption: option,
          content: content,
          callBack: () {
            if (callBack != null) {
              callBack!(this);
            }
          });
    } else if (componentName == ComponetType.image.value) {
      hotSportWidget = HotSportImage(
          componetOption: option,
          content: content,
          callBack: (String url) {
            if (callBack != null) {
              callBack!(this);
            }
          });
    } else if (componentName == ComponetType.foodImage.value) {
      hotSportWidget = HotSportFoodImage(
          componetOption: option,
          content: content,
          addWidgetCallBack: (WidgetInfo widgetInfo) {
            // if (divUpdatCallBack != null) {
            //   divUpdatCallBack!(widgetInfo);
            // }
          },
          callBack: (String url) {
            if (callBack != null) {
              callBack!(this);
            }
          });
    } else if (componentName == ComponetType.video.value) {
      hotSportWidget = HotSportVideo(componetOption: option, content: content);
    } else if (componentName == ComponetType.animation.value) {
      hotSportWidget = HotSportLottie(componetOption: option, content: content);
    } else if (componentName == ComponetType.table.value) {
      hotSportWidget = HotSportTable(componetOption: option, content: content);
    } else if (componentName == ComponetType.div.value) {
      hotSportWidget = HotSportDiv(componetOption: option);
    } else if (componentName == ComponetType.food1.value) {
      hotSportWidget = HotSportFoodButton(
        HotSportButtonType.food1,
        food,
        componetOption: option,
      );
    } else if (componentName == ComponetType.food2.value) {
      hotSportWidget = HotSportFoodButton(
        HotSportButtonType.food2,
        food,
        componetOption: option,
      );
    } else if (componentName == ComponetType.food3.value) {
      hotSportWidget = HotSportFoodButton(
        HotSportButtonType.food3,
        food,
        componetOption: option,
      );
    } else if (componentName == ComponetType.food4.value) {
      hotSportWidget = HotSportFoodButton(
        HotSportButtonType.food4,
        food,
        componetOption: option,
      );
    } else if (componentName == ComponetType.food5.value) {
      hotSportWidget = HotSportFoodButton(
        HotSportButtonType.food5,
        food,
        componetOption: option,
      );
    } else if (componentName == ComponetType.navBar.value) {
      hotSportWidget = HotSportNavBar(
          componetOption: option, customWidget: customWidget, content: content);
    } else if (componentName == ComponetType.search.value) {
      hotSportWidget = HotSportSearch(componetOption: option, content: content);
    } else if (componentName == ComponetType.shopCart.value) {
      hotSportWidget = HotSportShopCart(
          componetOption: option, customWidget: customWidget, content: content);
    } else if (componentName == ComponetType.shopCartRounded.value) {
      hotSportWidget = HotSportShopCartRounded(
          componetOption: option, customWidget: customWidget, content: content);
    } else if (componentName == ComponetType.shopCartIconButton.value) {
      hotSportWidget = HotSportShopCartIconButton(
          componetOption: option, customWidget: customWidget, content: content);
    }

    return hotSportWidget ?? const HotSportWidget();

    // componentName
  }

  @override
  Widget build(ComponetOption? option) => child(option);

  @override
  Widget buildDrageChildWidget(ComponetOption? option, BuildContext context) {
    if (widgetBuilder != null) {
      return widgetBuilder!(context, this);
    }
    return Container();
  }

  WidgetInfo.fromJson(Map<String, dynamic> json,{String? foodCategoryName})
      : componentTag = json['componentTag'],
        componentName = json['componentName'],
        componentId = json['componentId'],
        content = json['content'],
        food = json['food'] == null ? null : (jsonConvert.fromJson(json['food'],fixPageTitle: foodCategoryName));

  Map<String, dynamic> toJson() => {
        'componentTag': componentTag,
        'componentName': componentName,
        'componentId': componentId,
        'content': content,
        'food': jsonConvert.toJson(food) //?? Food.empty.toJson()
      };
}
