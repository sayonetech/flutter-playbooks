import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../ui/list_view.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Random Name Generator',
      home: new RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.blueAccent,
      ),
    );
  }
}


