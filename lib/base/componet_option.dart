part of hot_sport;

class ComponetOption {
  //..
  SportMoldeSizeStyle? size;

  SportMoldeTextStyle? textStyle;

  SportMoldePosition? position;

  SportMoldeBackground? background;

  SportMoldeBoxDecoration? boxDecoration;

  SportMoldeFood? foodModelProperty;

  SportMoldeEvent? event;

  ComponetOption.empty({required WidgetInfo data}) {
    size = SportMoldeSizeStyle(
        height: data.option == null
            ? data.hotSportWidget!.defaultHight
            : data.option!.size!.height,
        width: data.option == null
            ? data.hotSportWidget!.defaultWidth
            : data.option!.size!.width);
    textStyle = SportMoldeTextStyle();
    position = SportMoldePosition(x: 0, y: 0);
    background = SportMoldeBackground(hexColor: '', imageUrl: '');
    boxDecoration = SportMoldeBoxDecoration();
    foodModelProperty = SportMoldeFood(showFoodName: true, showFoodUnit: true);
    event = SportMoldeEvent();
  }

  ComponetOption(
      {this.size,
      this.textStyle,
      this.position,
      this.background,
      this.boxDecoration,
      this.foodModelProperty,
      this.event})
      : assert(size != null, 'ComponetOption -> size 不能为空'),
        assert(textStyle != null, 'ComponetOption -> textStyle 不能为空'),
        assert(background != null, 'ComponetOption -> background 不能为空'),
        assert(boxDecoration != null, 'ComponetOption -> boxDecoration 不能为空'),
        assert(foodModelProperty != null,
            'ComponetOption -> foodModelProperty 不能为空');

  ComponetOption.fromJson(Map<String, dynamic> json) {
    size = json['size'] != null
        ? SportMoldeSizeStyle.fromJson(json['size'])
        : null;
    textStyle = json['textStyle'] != null
        ? SportMoldeTextStyle.fromJson(json['textStyle'])
        : null;
    position = json['position'] != null
        ? SportMoldePosition.fromJson(json['position'])
        : null;
    background = json['background'] != null
        ? SportMoldeBackground.fromJson(json['background'])
        : null;
    boxDecoration = json['boxDecoration'] != null
        ? SportMoldeBoxDecoration.fromJson(json['boxDecoration'])
        : null;
    foodModelProperty = json['foodModelProperty'] != null
        ? SportMoldeFood.fromJson(json['foodModelProperty'])
        : null;
    event =
        json['event'] != null ? SportMoldeEvent.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (size != null) {
      data['size'] = size!.toJson();
    }
    if (textStyle != null) {
      data['textStyle'] = textStyle!.toJson();
    }
    if (position != null) {
      data['position'] = position!.toJson();
    }
    if (background != null) {
      data['background'] = background!.toJson();
    }
    if (boxDecoration != null) {
      data['boxDecoration'] = boxDecoration!.toJson();
    }
    if (foodModelProperty != null) {
      data['foodModelProperty'] = foodModelProperty!.toJson();
    }
    if (event != null) {
      data['event'] = event!.toJson();
    }
    return data;
  }
}
