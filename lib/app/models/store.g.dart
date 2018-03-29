// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => new Store(
    name: json['name'] as String,
    id: json['id'] as String,
    color: json['color'] as String,
    type: json['type'] as String);

abstract class _$StoreSerializerMixin {
  String get name;
  String get id;
  String get color;
  String get type;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'id': id, 'color': color, 'type': type};
}
