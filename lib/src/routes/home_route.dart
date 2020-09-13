import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Header(),
      body: Center(
        child: Text('Home'),
      )
    );
  }
}

class _Header extends StatelessWidget with PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.settings),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        )
      ],

      title: Text('ホーム'),

      backgroundColor: Colors.yellow[700],
      centerTitle: true,
      elevation: 0.0,
    );
  }
}