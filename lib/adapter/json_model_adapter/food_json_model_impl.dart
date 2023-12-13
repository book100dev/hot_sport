
import 'package:flutter/material.dart';
import 'package:hot_sport/hot_sport.dart';
import 'json_model_type_registry_impl.dart';

class FoodJsonModelImpl extends JsonModelTypeRegistryImpl
    implements FoodJsonModelInterface {
  @override
  T? fromJson<T>(Map<String, dynamic> json,{String? fixPageTitle}) {
    if (!isAdapterRegistered(T)) {
      return null;
    }
    ResolvedJsonModelAdapter? resolvedAdapter = findAdapterForTypeId(T);
    var jsonString = resolvedAdapter?.adapter.fromJson(json,fixPageTitle: fixPageTitle);
    return jsonString;
  }

  @override
  Map<String, dynamic>? toJson<T>(dynamic data) {
    if (!isAdapterRegistered(T)) {
      return null;
    }
    ResolvedJsonModelAdapter? resolvedAdapter = findAdapterForTypeId(T);
    Map<String, dynamic>? map = resolvedAdapter?.adapter.toJson(data);
    return map;
  }
  
  @override
  String content<T>({required T food,required ComponetType componetType}) {
    if (!isAdapterRegistered(T)) {
      return '';
    }
    ResolvedJsonModelAdapter? resolvedAdapter = findAdapterForTypeId(T);
    String? content = resolvedAdapter?.adapter.content(food: food,componetType: componetType);
    return content ?? '';
  }
// @override
//    String content<T>({required ComponetType componetType}) {
//         if (!isAdapterRegistered(T)) {
//       return '';
//     }
//     ResolvedJsonModelAdapter? resolvedAdapter = findAdapterForTypeId(T);
//     resolvedAdapter?.adapter.content(data);
//    }
  
}
