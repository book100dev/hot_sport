import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hot_sport/adapter/json_model_adapter/json_model_type_adapter.dart';
import 'package:hot_sport/hot_sport.dart';


/// 被适配者
class Adaptee {
  String concreteOperator() {
    return 'Adaptee';
  }
}
 
abstract class ITarget {
  String operator();
}
 
/// 对象适配器
class ObjectAdapter implements ITarget {
  var adaptee = Adaptee();
 
  String operator() {
    return adaptee.concreteOperator();
  }
}
 
/// 类适配器
class ClassAdapter extends Adaptee {
  String operator() {
    return super.concreteOperator();
  }
}

class Client {
  Client(this.adapter);
 
  final ITarget adapter;
 
  operator() {
    var result = adapter.operator();
    assert(result == 'Adaptee');
  }
}



void main() {
  test('adds one to input values', () {

   var sss =  ClassAdapter().operator();
   print(sss);
    // var test = jsonConvert.fromJson({'foodName': '熏肉大饼'});

    // var pppp = jsonConvert.toJson(const Food(foodName: '熏肉大饼'));

    // final builders = {
    //   ComponetType.foodImage: (context, hotSportRequest, completer) =>
    //       IDEHotSportImage(request: hotSportRequest, completer: completer),
    //   1000: (context, hotSportRequest, completer) => IDEHotSportGestureDetector(
    //       request: hotSportRequest, completer: completer),
    // };
    // hotSportInterface.registerCustomHotSportBuilders(builders);
    // hotSportInterface.registerModelAdapter(JsonModel<Food>());
  });
}

class JsonModel<T> extends JsonModelTypeAdapter {
  Food? food;

  @override
  fromJson(Map<String, dynamic> json) {
    food = Food.fromJson(json);
    return food;
  }

  @override
  Map<String, dynamic>? toJson(dynamic data) {
    if (data is Food) return data.toJson();
    return null;
  }

  @override
  Type get type => Food;
}

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class Food {
  const Food({
    required this.foodName,
    this.foodOnlineCategoryName,
    this.foodID,
    this.foodKey,
    this.unitKey,
    this.foodOnlineCategoryKey,
    this.foodOnlineCategoryID,
    this.price,
    this.vipPrice,
    this.material3durl,
    this.imgePath,
    this.material2durl,
    this.unit,
    this.foodMnemonicCode,
    this.foodCode,
  });

  static const Food empty = Food(
      foodName: 'Food',
      foodOnlineCategoryName: '',
      foodID: 000,
      foodKey: '',
      unit: '规格',
      unitKey: '',
      foodOnlineCategoryID: '',
      foodOnlineCategoryKey: '',
      price: '价格',
      vipPrice: 'vip 价格',
      material2durl: '',
      material3durl: '',
      foodMnemonicCode: '',
      foodCode: '',
      imgePath: '');

  String get imageUrl {
    String url = 'https://res.hualala.com/' + imgePath!;
    return url;
  }

  factory Food.fromJson(Map<String, dynamic> jsonRes) => Food(
      foodName: asT<String>(jsonRes['foodName']) ?? '',
      foodOnlineCategoryName:
          asT<String>(jsonRes['foodOnlineCategoryName']) ?? '',
      foodID: asT<int>(jsonRes['foodID']) ?? 000,
      foodKey: asT<String>(jsonRes['foodKey']) ?? '',
      unitKey: asT<String>(jsonRes['unitKey']) ?? '',
      foodOnlineCategoryKey:
          asT<String>(jsonRes['foodOnlineCategoryKey']) ?? '',
      foodOnlineCategoryID: asT<String>(jsonRes['foodOnlineCategoryID']) ?? '',
      price: asT<String>(jsonRes['price'].toString()) ?? '',
      vipPrice: asT<String>(jsonRes['vipPrice'].toString()) ?? '',
      material3durl: asT<String>(jsonRes['material_3DUrl']) ?? '',
      imgePath: asT<String>(jsonRes['imgePath']) ?? '',
      material2durl: asT<String>(jsonRes['material_2DUrl']) ?? '',
      unit: asT<String>(jsonRes['unit']) ?? '',
      foodCode: asT<String>(jsonRes['foodCode']) ?? '',
      foodMnemonicCode: '');

  final String foodName;
  final String? foodOnlineCategoryName;
  final int? foodID;
  final String? foodKey;
  final String? unitKey;
  final String? foodOnlineCategoryKey;
  final String? foodOnlineCategoryID;
  final String? price;
  final String? vipPrice;
  final String? material3durl;
  final String? imgePath;
  final String? material2durl;
  final String? unit;
  final String? foodMnemonicCode;
  final String? foodCode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'foodName': foodName,
        'foodOnlineCategoryName': foodOnlineCategoryName,
        'foodID': foodID,
        'foodKey': foodKey,
        'unitKey': unitKey,
        'foodOnlineCategoryKey': foodOnlineCategoryKey,
        'foodOnlineCategoryID': foodOnlineCategoryID,
        'price': price,
        'vipPrice': vipPrice,
        'material_3DUrl': material3durl,
        'imgePath': imgePath,
        'material_2DUrl': material2durl,
        'unit': unit,
        'foodMnemonicCode': foodMnemonicCode,
        'foodCode': foodCode,
      };
}

class IDEHotSportImage extends StatelessWidget {
  final HotSportRequest request;
  final Function(HotSportResponse) completer;
  const IDEHotSportImage(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  Widget get child => ExtendedImage.network(
        '',
        fit: BoxFit.fill,
        cache: true,
        border: Border.all(color: Colors.white, width: 1.0),
        shape: BoxShape.rectangle,
      );

  @override
  Widget build(BuildContext context) {
    return DragTarget<WidgetInfo>(
      onWillAccept: (var hotSportObject) {
        if (kDebugMode) {
          print('div 收到事件传递');
        }
        return true;
      },
      onAccept: (data) {
        var widgetInfojson = data.toJson();
        WidgetInfo widgetInfo = WidgetInfo.fromJson(widgetInfojson);
        completer(HotSportResponse(confirmed: true, data: widgetInfo));
      },
      builder: (BuildContext context, List<WidgetInfo?> candidateData,
          List<dynamic> rejectedData) {
        return Stack(
          children: [Positioned.fill(child: request.data)],
        );
      },
    );
  }
}

class IDEHotSportGestureDetector extends StatelessWidget {
  final HotSportRequest request;
  final Function(HotSportResponse) completer;
  const IDEHotSportGestureDetector(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: (details) {}, onTap: () {}, child: Stack());
  }
}
