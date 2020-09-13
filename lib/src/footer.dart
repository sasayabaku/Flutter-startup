import 'package:flutter/material.dart';


class Footer extends StatefulWidget{
  const Footer();

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  int _selectIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  static const _footerIcons = [
    Icons.home,
    Icons.textsms,
    Icons.access_time,
    Icons.content_paste,
    Icons.group_work
  ];

  static const _footerItemNames = [
    'Home',
    'Talk',
    'Timeline',
    'News',
    'Wallet'
  ];

  @override
  void initState() {
    super.initState();
    _bottomNavigationBarItems.add(_UpdateActiveState(0));
    for ( var i = 1; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(_UpdateDeactiveState(i));
    }
  }

  BottomNavigationBarItem _UpdateActiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.yellow[800]
      ),
      title: Text(
        _footerItemNames[index],
        style: TextStyle(
          color: Colors.yellow[800]
        ),
      )
    );
  }

  BottomNavigationBarItem _UpdateDeactiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.black26,
      ),
      title: Text(
        _footerItemNames[index],
        style: TextStyle(
          color: Colors.black26,
        ),
      )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavigationBarItems[_selectIndex] = _UpdateDeactiveState(_selectIndex);
      _bottomNavigationBarItems[index] = _UpdateActiveState(index);
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomNavigationBarItems,
      currentIndex: _selectIndex,
      onTap: _onItemTapped ,
    );
  }
}