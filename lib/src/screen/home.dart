import 'package:flutter/material.dart';

import 'login.dart';
import 'start.dart';
import 'my_library.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
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
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.map),
                  text: 'Start',
                ),
                Tab(
                  icon: Icon(Icons.list_alt),
                  text: 'My Library',
                )
              ],
            ),
            title: const Text('My game library'),
          ),
          body: TabBarView (
            children: [
              const Start(),
              MyLibrary()
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
