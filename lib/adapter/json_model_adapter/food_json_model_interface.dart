// import 'json_model_type_registry.dart';

part of hot_sport;

abstract class FoodJsonModelInterface implements JsonModelTypeRegistry {
  T? fromJson<T>(Map<String, dynamic> json,{String? fixPageTitle});

  Map<String, dynamic>? toJson<T>(dynamic data);

  String content<T>({required T food,required ComponetType componetType});
}
