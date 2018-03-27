import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './routes.dart';
import './application.dart';
import '../views/landing_page.dart';

class AppComponent extends StatefulWidget {

  @override
  State createState() {
    return new AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {

  AppComponentState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }


  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      title: 'Fluro',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }
}