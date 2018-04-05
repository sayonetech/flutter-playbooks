import 'package:flutter/material.dart';
import 'package:helloworld/app/app_component.dart';
import 'package:helloworld/app/config/injector.dart';
import 'package:helloworld/app/events/store_event.dart';

void main() {
  Injector _injector = new Injector();
  print("main");
  print(_injector);

  _injector.apiClient.fetchMalls("12.969840","77.582443").then((stores) {
    print(stores);
    _injector.eventBus.fire(new StoreLoadedEvent(stores));
  });

  _injector.eventBus.on().listen((event) {
    // Print the runtime type. Such a set up could be used for logging.
    print(event.runtimeType);
  });

  _injector.eventBus.on(StoreLoadedEvent).listen((dynamic event) {
      print("Listen");
      print(event.store);
  });
  runApp(new AppComponent());
}