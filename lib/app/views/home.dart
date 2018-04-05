import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:helloworld/app/application.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/app/config/injector.dart';
import 'package:map_view/map_view.dart';

class HomeController extends StatefulWidget{
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomeController> with TickerProviderStateMixin {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String _simpleValue1 = 'Menu item value one';
  final String _simpleValue2 = 'Menu item value two';
  final String _simpleValue3 = 'Menu item value three';
  String _simpleValue;

  Injector injector = new Injector();
  TabController _tabController;
  static const MethodChannel methodChannel = const MethodChannel('com.sayonetech/maps');
  int _tab = 0;
  MapView mapView;

  @override
  void initState() {
    super.initState();
    mapView = injector.mapView;
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Directory'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(icon: new Icon(Icons.contacts), onPressed: _showDetail),
          new IconButton(icon: new Icon(Icons.map), onPressed: _launchMaps),
          new PopupMenuButton<String>(
            onSelected: showMenuSelection,
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              const PopupMenuItem<String>(
                  value: 'Toolbar menu',
                  child: const Text('Toolbar menu')
              ),
              const PopupMenuItem<String>(
                  value: 'Right here',
                  child: const Text('Right here')
              ),
              const PopupMenuItem<String>(
                  value: 'Hooray!',
                  child: const Text('Hooray!')
              ),
            ],
          )
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildSuggestions(),
          new Calendar(
            isExpandable: true
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: (int value) {
          _tabController.animateTo(value);
          setState(() {
            _tab = value;
          });
        },
        currentIndex: _tab,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.calendar_today),
            title: new Text('Calendar'),
          ),
        ],
      ),
    );
  }

  void showMenuSelection(String value) {
    if (<String>[_simpleValue1, _simpleValue2, _simpleValue3].contains(value))
      _simpleValue = value;
    showInSnackBar('You selected: $value');
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  }

  void _showDetail(){
    Application.router.navigateTo(context, "/home/detail");
  }

  void _launchMaps() {
    mapView.show(new MapOptions(showUserLocation: true));
      //methodChannel.invokeMethod('launchMaps', {"lat": 37.4219999, "long": -122.0840575});
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved List'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),

        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
}