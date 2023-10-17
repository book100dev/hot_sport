

import 'json_model_type_adapter.dart';

abstract class JsonModelTypeRegistry {

  void registerAdapter<T>(JsonModelTypeAdapter<T> adapter);

  bool isAdapterRegistered(Type type);

}
