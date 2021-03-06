import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/app/router/route_handlers.dart';

class Routes {

  static String root = "/";
  static String home = "/home";
  //static String favourites = "/favourites";
  static String detail = "/home/detail";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print(router);
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(detail, handler: detailHandler);
    router.define(root, handler: rootHandler);
    router.define(home, handler: homeHandler);

  }

}