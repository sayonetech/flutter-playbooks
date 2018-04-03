import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:helloworld/app/application.dart';


class HomeController extends StatefulWidget{
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomeController> with TickerProviderStateMixin {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  TabController _tabController;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Directory'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(icon: new Icon(Icons.contacts), onPressed: _showDetail),
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildSuggestions(),
          new ListView.builder(
            key: new PageStorageKey('notifications'),
            itemBuilder: (BuildContext context, int index) {
              return new ListTile(
                title: new Text('Notification $index'),
              );
            },
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
            icon: new Icon(Icons.map),
            title: new Text('Map'),
          ),
        ],
      ),
    );
  }

  void _showDetail(){
    Application.router.navigateTo(context, "/home/detail");
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