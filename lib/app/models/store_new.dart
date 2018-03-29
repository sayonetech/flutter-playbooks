library models.store_new;

import 'package:dson/dson.dart';

part 'store_new.g.dart';

@serializable
class Store extends _$StoreSerializable {
  num eggs = 0.0;
}