import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store extends Object with _$StoreSerializerMixin{

  final String name;
  final String id;
  final String color;
  final String type;

  Store({
    this.name,
    this.id,
    this.color,
    this.type
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Store.map(Map<String, dynamic> map) :
        id = map['id'],
        name = map['name'],
        type = map['type'],
        color = map['color'];
}