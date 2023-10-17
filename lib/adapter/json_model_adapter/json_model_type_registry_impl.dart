import 'json_model_type_adapter.dart';
import 'json_model_type_registry.dart';

class ResolvedJsonModelAdapter<T> {
  final JsonModelTypeAdapter adapter;
  final Type type;
  ResolvedJsonModelAdapter(this.adapter, this.type);
  bool matchesRuntimeType(dynamic value) => value.runtimeType == T;
  bool matchesType(dynamic value) => value is T;
}

class JsonModelTypeRegistryImpl implements JsonModelTypeRegistry {
  // static const reservedTypeIds = 100;

  final _typeAdapters = <int, ResolvedJsonModelAdapter>{};

  ResolvedJsonModelAdapter? findAdapterForTypeId(dynamic type) {
    return _typeAdapters[type.runtimeType.hashCode];
  }

  @override
  bool isAdapterRegistered(Type type) {
    return _typeAdapters[type.runtimeType.hashCode] != null;
  }

  @override
  void registerAdapter<T>(JsonModelTypeAdapter<T> adapter) {
    var resolved = ResolvedJsonModelAdapter(adapter, adapter.type);
    _typeAdapters[adapter.type.runtimeType.hashCode] = resolved;
  }
}
