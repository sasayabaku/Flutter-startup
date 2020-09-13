import 'package:flutter/material.dart';


class Talk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Header(),
      body: Center(
        child: Text('Talk'),
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

      title: Text('トーク'),

      backgroundColor: Colors.yellow[700],
      centerTitle: true,
      elevation: 0.0,
    );
  }
}