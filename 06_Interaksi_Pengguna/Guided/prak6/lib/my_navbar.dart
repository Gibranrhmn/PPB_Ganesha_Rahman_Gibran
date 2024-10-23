import 'package:flutter/material.dart';
import 'package:prak6/my_package.dart';
import 'package:prak6/my_tabbar.dart';

class myNavbar extends StatefulWidget {
  const myNavbar({super.key});

  @override
  State<myNavbar> createState() => _myNavbarState();
}

class _myNavbarState extends State<myNavbar> {
  int _selectedIndex = 0;

  void _onTappedItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    myTabbar(),
    myPackage(),
    myPackage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Navigation Bar"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_rounded), 
          label :'My TabBar'),
        BottomNavigationBarItem(
          icon: Icon(Icons.adb_rounded), 
          label :'My Package 1'),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_activity_rounded), 
          label :'My Package 2'),
      ],
      selectedItemColor: Colors.amber,
      currentIndex: _selectedIndex,
      onTap: _onTappedItem,
      ),
    );
  }
}