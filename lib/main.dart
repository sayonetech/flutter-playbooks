import 'package:flutter/material.dart';
import 'package:helloworld/app/app_component.dart';
import 'package:helloworld/app/config/injector.dart';

void main() {
  Injector _injector = new Injector();
  print("main");
  print(_injector);

  _injector.apiClient.fetchMalls("12.969840","77.582443").then((stores) {
    print(stores);
  });

  runApp(new AppComponent());
}