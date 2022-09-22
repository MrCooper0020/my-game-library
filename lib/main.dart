import 'package:flutter/material.dart';
import 'package:my_city/src/screen/maps.dart';
import 'package:my_city/src/screen/my_library.dart';
import 'src/screen/maps.dart';
import 'src/screen/my_library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_title',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'app_title'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.map),
                  text: 'maps_tab',
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
              const Maps(),
              MyLibrary()
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
