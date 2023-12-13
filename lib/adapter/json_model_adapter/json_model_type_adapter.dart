import 'package:hot_sport/hot_sport.dart';

abstract class JsonModelTypeAdapter<T> {
  Type get type;

  /// Is called when a value has to be decoded.
  T? fromJson(Map<String, dynamic> json,{String? fixPageTitle});

  Map<String, dynamic>? toJson(dynamic data);

  String content({required T food, required ComponetType componetType});
}
