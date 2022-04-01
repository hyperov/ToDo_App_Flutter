import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/base/Auth.dart';
import 'package:to_do_app_flutter/home/viewmodel/HomeViewModel.dart';

import '../../utils/AppColor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  var controller = Get.put(HomeViewModel());

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.lime,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch:
                 const MaterialColor(AppColors.white, AppColors.whiteMap),
            accentColor: AppColors.colorAccent),
        scaffoldBackgroundColor: const Color(AppColors.white),
      ),
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: GetX<HomeViewModel>(builder: (context) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.colorAccent,
            backgroundColor: Colors.limeAccent,
            elevation: 16,
            currentIndex: controller.bottomNavigationIndex.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_filled),
                  label: "Home",
                  backgroundColor: Colors.amber),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: "Profile",
                  backgroundColor: Colors.blue),
            ],
            onTap: (int index) {
              controller.bottomNavigationIndex.value = index;
            },
          );
        }),
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.network(Auth.instance.currentUser!.photoURL!))
          ],
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Note+'),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
          toolbarHeight: 140,
          backgroundColor: Colors.white,
          foregroundColor: Colors.lime,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Notes',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
