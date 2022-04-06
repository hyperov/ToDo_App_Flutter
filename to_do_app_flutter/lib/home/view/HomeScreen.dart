import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/base/Auth.dart';
import 'package:to_do_app_flutter/home/viewmodel/HomeViewModel.dart';
import 'package:to_do_app_flutter/notes/view/NotesDetailsScreen.dart';
import 'package:to_do_app_flutter/notes/view/NotesScreen.dart';
import 'package:to_do_app_flutter/notes/viewmodel/NotesViewModel.dart';

import '../../utils/AppColor.dart';
import 'ProfileWidget.dart';

class HomeScreen extends StatelessWidget {
  var controller = Get.put(HomeViewModel());
  final _notesViewModel = Get.put(NotesViewModel());

  final widgetOptions = [
    const NotesScreen(),
    const ProfileWidget(),
  ];

  HomeScreen({Key? key}) : super(key: key);

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
          title: const Text('Note+'),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
          toolbarHeight: 140,
          backgroundColor: Colors.white,
          foregroundColor: Colors.lime,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Obx(() =>
            widgetOptions.elementAt(controller.bottomNavigationIndex.value)),
        floatingActionButton: FloatingActionButton(
          onPressed: _gotoNotesDetailsScreen,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _gotoNotesDetailsScreen() {
    Get.to(() => NotesDetailsWidget());
  }
}
