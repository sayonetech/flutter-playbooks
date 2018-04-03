import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../views/detail/detail_page.dart';
import '../views/login/index.dart';
import '../views/home.dart';

var detailHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new DetailView();
});

var rootHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new LoginScreen();
});

var homeHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomeController();
});