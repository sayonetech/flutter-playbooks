import 'package:flutter/material.dart';
import '../../components/detail/title.dart';
import '../../components/detail/button_column.dart';

class DetailView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new ButtonColumnContainer(
              icon: Icons.call,
              label: 'CALL'),
          new ButtonColumnContainer(
              icon: Icons.near_me,
              label: 'ROUTE'),
          new ButtonColumnContainer(
              icon: Icons.share,
              label: 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Top Lakes'),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'assets/images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            new TitleContainer(),
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}