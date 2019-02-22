import 'package:flutter/material.dart';
import 'package:helloworld/app/app_component.dart';
import 'package:helloworld/app/config/injector.dart';
import 'package:helloworld/app/events/store_event.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/app/models/store.dart';

void main() async {
  Injector _injector = new Injector();
  print("main");
  print(_injector);
  //Clipboard
  Clipboard.setData(new ClipboardData(text: "Testing Clipboard"));
  ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
  print(data.text);

  //OLD Implemetation
  /*
  _injector.apiClient.fetchMalls("12.969840","77.582443").then((stores) {
    print(stores);
    _injector.eventBus.fire(new StoreLoadedEvent(stores));
  });*/

  //New & Simple
  List<Store> stores = await _injector.apiClient.fetchMalls("12.969840","77.582443");
  _injector.eventBus.fire(new StoreLoadedEvent(stores));

  _injector.eventBus.on().listen((event) {
    // Print the runtime type. Such a set up could be used for logging.
    print(event.runtimeType);
  });

  _injector.eventBus.on<StoreLoadedEvent>().listen((event) {
    // All events are of type UserLoggedInEvent (or subtypes of it).
    print(event.store);
  });

  runApp(new AppComponent());
}