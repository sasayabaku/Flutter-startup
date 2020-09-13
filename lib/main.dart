import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

import 'src/home.dart';
import 'src/header.dart';
// import 'src/footer.dart';
import 'src/root.dart';


void main() => runApp(HeaderApp());

class HeaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: RootWidget(),
    );
  }
}



class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomePage(),
      // home: MainPage(),
      // home: Home()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pageList = [
    CustomPage(pannelColor: Colors.cyan, title: 'Home'),
    CustomPage(pannelColor: Colors.green, title: 'Settings'),
    Home()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Fultter Tutorial'),
      // ),
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setting'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomPage extends StatelessWidget {
  final Color pannelColor;
  final String title;

  CustomPage({@required this.pannelColor, @required this.title});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.title;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Color material'),
      ),
      body: new Container(
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: pannelColor,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: titleTextStyle.fontSize,
                  color: titleTextStyle.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// void main() => {debugPaintSizeEnabled = false, runApp(HomePage())};

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "paging sample",
//       home: HomePage(),
//       );
//   }
// }



// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   // static List<Widget> _pageList = [
//   //   CustomPage1(),
//   //   CustomPage1(),
//   //   CustomPage1()
//   // ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('paging sample')
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   items: const <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.home),
//       //       title: Text('Home')
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.settings),
//       //       title: Text('Setting')
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.search),
//       //       title: Text('Search')
//       //     ),          
//       //   ],
//       //   currentIndex: _selectedIndex,
//       //   onTap: _onItemTapped,
//       // ),
//     );
//   }
// }


class CustomPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('ChildText')
      )
    );
  }
}





class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(title: 'Welcome to Flutter', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
        appBar: AppBar(
         title: Text('Startup Name Generator'),
        ),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ));
  }
}
