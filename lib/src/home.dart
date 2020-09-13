import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MainPage(),
        '/subpage': (BuildContext context) => new SubPage()
      });
  }
}


// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       child: Center(
//         child:Text('Main')
//         )
//     );
//   }
// }

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Tutorial'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Text('This app is Sandbox'),
              RaisedButton(onPressed: () => Navigator.of(context).pushNamed("/subpage"), child: new Text('Subページへ'),)
            ]
          )
        )
      )
    );
  }
}


class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Subpage')
      ),
      body: new Container(
        padding: new EdgeInsets.all(28.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Text('This page is Subpage from Main page by Navigetor'),
            ]
          )
        )
      )
    );
  }
}