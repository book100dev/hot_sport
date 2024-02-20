part of hot_sport;

mixin FoodViewModelDelegate {
  HotSportFoodValue get hotSportFoodValue;
  set hotSportFoodValue(HotSportFoodValue value) {}
  void userUpdateHotSportFoodValue(HotSportFoodValue value, double foodNumber);
  void hotSportButtonReduce(HotSportFoodValue value, double foodNumber);
  void hotSportButtonAdd(HotSportFoodValue value, double foodNumber);
  void hotSportButtonInputChanged(HotSportFoodValue value, double foodNumber);
  bool userWillShouldUpdateWithFoodValue(HotSportFoodValue value,
      {required bool condition});
}

enum FoodButtonDataState { none, waiting, soldOut, sale, noData, done }

abstract class FoodGetXControllerDelegate<T> {
  //沽清盒子
  T getBox({required dynamic food});
  //获取菜品ID
  String getFoodId({required dynamic food});
  //是否显示
  FoodButtonDataState visible({required dynamic food});
  //默认数量
  double initFoodNumber({required dynamic food});
  //最小可点数量
  double minFoodNumber({required dynamic food});
  //最大可点数量
  double maxFoodNumber({required dynamic food});
}

class FoodGetXController extends GetxController {
  FoodGetXControllerDelegate? delegate;

  Function(HotSportFoodValue hotSportFoodValue, double foodNumber,
      dynamic foodViewModel)? hotSportFoodButtonInputValueChanged;

  Function(HotSportFoodValue hotSportFoodValue, double foodNumber,
      dynamic foodViewModel)? hotSportFoodButtonValueChanged;

  Function(HotSportFoodValue hotSportFoodValue, double foodNumber,
      dynamic foodViewModel)? hotSportFoodButtonReduce;

  Function(HotSportFoodValue hotSportFoodValue, double foodNumber,
      dynamic foodViewModel)? hotSportFoodButtonAdd;

  bool Function(HotSportFoodValue hotSportFoodValue, ValueChanged valueChanged,
      bool condition)? hotSportFoodValueCanChanged;

  List<HotSportFoodController> hotSportControllers = [];

  HotSportFoodController? findCurrentHotSportController(
      {required String foodName, required String unit}) {
    return hotSportControllers.firstWhereOrNull((element) {
      dynamic food = element.food;
      try {
        if (food.foodName == foodName && food.unit == unit) {
          return true;
        }
        return false;
      } catch (e) {
        return false;
      }
    });
  }

  void updateHotSport({required String foodName, required String unit}) {
    HotSportFoodController? controller =
        findCurrentHotSportController(foodName: foodName, unit: unit);
    if (controller != null) {
      update([controller.food.hashCode]);
    }
  }

  //是否要显示
  FoodButtonDataState visible(food) {
    if (delegate == null) return FoodButtonDataState.none;
    return delegate!.visible(food: food);
  }

  //初始化数量
  double initFoodNumber(
    food,
  ) {
    if (delegate == null) return 0;
    return delegate!.initFoodNumber(food: food);
  }
}

class HotSportFoodController<T> extends ValueNotifier<HotSportFoodValue> {
  HotSportFoodController({T? food})
      : super(food == null
            ? HotSportFoodValue.empty
            : HotSportFoodValue(food: food)) {
    init();
  }
  HotSportFoodController.fromValue(HotSportFoodValue? value)
      : assert(
          value == null,
          'New HotSportFoodValue $value has an invalid non-empty composing range '
          'It is recommended to use a valid composing range, '
          'even for readonly text fields',
        ),
        super(value ?? HotSportFoodValue.empty) {
    init();
  }

  FoodViewModelDelegate? delegate;

  double minNumber = 0;
  double maxNumber = 9999;

  reduceFood({bool remove = false}) {
    delegate?.userWillShouldUpdateWithFoodValue(value, condition: false);
    remove ? count.value = 0 : count.value--;
    delegate?.hotSportButtonReduce(value, count.value);
  }

  addFood() {
    count.value++;
    delegate?.hotSportButtonAdd(value, count.value);
  }

  changeFood() {
    delegate?.hotSportButtonInputChanged(value, count.value);
  }

  set foodNumber(double number) {
    // number.then((value) {
    //   double n = 0;
    //   try {
    //     n = double.tryParse(value.toString()) ?? 0.0;
    //   } catch (e) {
    //     n = 0.0;
    //   }
    //   count.value = n;
    // });
    double n = 0;
    try {
      n = double.tryParse(number.toString()) ?? 0.0;
    } catch (e) {
      n = 0.0;
    }
    count.value = n;
  }

  double get number => count.value;

  late final ValueNotifier<double> count;
  void init() {
    count = ValueNotifier<double>(0.0);
    double lastCount = count.value;
    count.addListener(() {
      if (count.value > lastCount) {
        print('加菜');
      } else {
        print('减菜');
      }
      delegate?.userUpdateHotSportFoodValue(value, number);
      lastCount = count.value;
    });
  }

  bool get canAdd =>
      delegate?.userWillShouldUpdateWithFoodValue(value, condition: true) ??
      true;

  bool get canReduce =>
      delegate?.userWillShouldUpdateWithFoodValue(value, condition: false) ??
      true;

  void updateHotSportButtonCount() {
    bool isRegister = Get.isRegistered<FoodGetXController>();
    FoodGetXController? foodGetXController =
        isRegister ? Get.find<FoodGetXController>() : null;
    foodGetXController?.update([food.hashCode]);
  }

  /// The current string the user is editing.
  T get food => value.food;

  set food(T newFood) {
    value = value.copyWith(
      food: newFood,
    );
  }

  void clear() {}

  void clearComposing() {}
}

class HotSportFoodValue<T> {
  HotSportFoodValue({this.food}) {
    if (this.food == null) {
      this.food = emptyObject;
    }
  }

  /// Creates an instance of this class from a JSON object.
  factory HotSportFoodValue.fromJSON(Map<String, dynamic> encoded) {
    return HotSportFoodValue(
      food: encoded['food'],
    );
  }

  /// Returns a representation of this object as a JSON object.
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'food': jsonConvert.toJson(food),
    };
  }

  T? food;

  /// A value that corresponds to the empty string with no selection and no composing range.
  T? get emptyObject => jsonConvert.fromJson({});

  static HotSportFoodValue empty = HotSportFoodValue();

  /// Creates a copy of this value but with the given fields replaced with the new values.
  HotSportFoodValue copyWith({
    T? food,
  }) {
    return HotSportFoodValue(
      food: food ?? this.food,
    );
  }

  bool get isComposingRangeValid => true;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HotSportFoodValue && other.food == food;
  }

  @override
  int get hashCode => food.hashCode;
}
