// GENERATED CODE - DO NOT MODIFY BY HAND


part of 'store.dart';

// **************************************************************************
// Generator: SerializerGenerator
// Target: class StoreSerializer
// **************************************************************************

abstract class _$StoreSerializer implements Serializer<Store> {
  Map toMap(Store model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.id != null) {
        ret["id"] = model.id;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  Store fromMap(Map map, {Store model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Store) {
      model = createModel();
    }
    model.name = map["name"];
    model.id = map["id"];
    return model;
  }

  String modelString() => "Store";
}