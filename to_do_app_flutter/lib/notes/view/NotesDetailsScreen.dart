import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/notes/viewmodel/NotesDetailsViewModel.dart';
import 'package:to_do_app_flutter/utils/AppColor.dart';

class NotesDetailsWidget extends StatelessWidget {
  NotesDetailsWidget({Key? key}) : super(key: key);

  final NotesDetailsViewModel controller = Get.put(NotesDetailsViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            _getBackgroundColor(controller.bottomNavigationIndex.value),
        appBar: AppBar(),
        bottomNavigationBar: GetX<NotesDetailsViewModel>(builder: (context) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: AppColors.colorAccent,
            backgroundColor: Colors.white,
            elevation: 16,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.bottomNavigationIndex.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle, color: Colors.white),
                  activeIcon: Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  label: "white",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle, color: Colors.black),
                  activeIcon: Icon(Icons.circle, color: Colors.black),
                  label: "black",
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle, color: Colors.blue),
                  activeIcon: Icon(Icons.circle, color: Colors.blue),
                  label: "blue",
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle, color: Colors.lime),
                  activeIcon: Icon(Icons.circle, color: Colors.lime),
                  label: "lime",
                  backgroundColor: Colors.lime),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle, color: Colors.amber),
                  activeIcon: Icon(Icons.circle, color: Colors.amber),
                  label: "amber",
                  backgroundColor: Colors.amber),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle, color: Colors.deepOrangeAccent),
                  activeIcon:
                      Icon(Icons.circle, color: Colors.deepOrangeAccent),
                  label: "orange",
                  backgroundColor: Colors.deepOrangeAccent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle, color: Colors.deepPurple),
                  activeIcon: Icon(Icons.circle, color: Colors.deepPurple),
                  label: "purple",
                  backgroundColor: Colors.deepPurple)
            ],
            onTap: (int index) {
              controller.bottomNavigationIndex.value = index;
              _getBackgroundColor(index);
            },
          );
        }),
        // child: const TextField(
        //   showCursor: true,
        //   autocorrect: true,
        //   cursorColor: Colors.blue,
        //
        // ),
      ),
    );
  }

  Color _getBackgroundColor(int index) {
    Color color = Colors.white;
    switch (index) {
      case 0:
        color = Colors.white;
        break;
      case 1:
        color = Colors.black;
        break;
      case 2:
        color = Colors.blue;
        break;
      case 3:
        color = Colors.lime;
        break;
      case 4:
        color = Colors.amber;
        break;
      case 5:
        color = Colors.deepOrangeAccent;
        break;
      case 6:
        color = Colors.deepPurple;
        break;
    }
    return color;
  }
}
