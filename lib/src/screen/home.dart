import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'login.dart';
import 'start.dart';
import 'my_library.dart';
import 'settings.dart';

class HomePageController extends GetxController{
  var selectedIndex = 0.obs;

  void changeSelectedTab(index) => selectedIndex.value = index;
}

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}

class HomePage extends GetView<HomePageController> {
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _screens = <Widget>[
    Start(),
    MyLibrary(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
                IconButton(
                icon: const Icon(Icons.outbond),
                tooltip: 'Log out',
                onPressed: () {
                  final localStorage = GetStorage();

                  localStorage.remove('logged_user_email');
                  Get.offAll(Login());
                },
              ),
            ],
            title: const Text('My game library'),
          ),
          body: Obx(() => Center(
            child: _screens.elementAt(controller.selectedIndex.value),
          )),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
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
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.blue,
            onTap: controller.changeSelectedTab,
          ))
        );
  }
}
