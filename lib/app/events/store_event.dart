import '../models/store.dart';

class StoreLoadedEvent {
  List<Store> store;

  StoreLoadedEvent(this.store);
}