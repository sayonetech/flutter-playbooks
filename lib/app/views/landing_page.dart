import 'package:flutter/material.dart';
import '../config/application.dart';


class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Material(
      color: Colors.blueAccent,
      child: new InkWell(
        onTap: () => Application.router.navigateTo(context, "/home"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Directory Demo",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            new Text(
              "Tap to open!",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
