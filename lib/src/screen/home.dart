import 'package:flutter/material.dart';

import 'login.dart';
import 'start.dart';
import 'my_library.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _screens = <Widget>[
    const Start(),
    MyLibrary(),
    const Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
                IconButton(
                icon: const Icon(Icons.outbond),
                tooltip: 'Log out',
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ],
            title: const Text('My game library'),
          ),
          body: Center(
            child: _screens.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'My library',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Config',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          )
        );
  }
}
