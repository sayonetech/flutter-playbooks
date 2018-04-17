import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'store.g.dart';

class Store {
  String name;
  String id;
}

@GenSerializer()
class StoreSerializer extends Serializer<Store> with _$StoreSerializer {
  @override
  Store createModel() => new Store();
}