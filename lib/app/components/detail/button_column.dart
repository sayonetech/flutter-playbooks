import 'package:flutter/material.dart';

class ButtonColumnContainer extends StatelessWidget {
  final IconData icon;
  final String label;

  ButtonColumnContainer({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return (new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    ));
  }
}