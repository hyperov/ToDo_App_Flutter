import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/notes/viewmodel/NotesDetailsViewModel.dart';
import 'package:to_do_app_flutter/utils/AppColor.dart';

class NotesDetailsWidget extends StatelessWidget {
  NotesDetailsWidget({Key? key}) : super(key: key);

  final NotesDetailsViewModel detailsController =
      Get.put(NotesDetailsViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
            backgroundColor: _getBackgroundColor(
                detailsController.bottomNavigationIndex.value),
            appBar: AppBar(),
            body: Column(
              children: [
                TextField(
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                  ),
                  decoration: InputDecoration(
                    prefixText: "Title: ",
                    prefixStyle: const TextStyle(color: Colors.green),
                    counterText:
                        detailsController.titleTextCounter.value.toString(),
                  ),
                ),
                Expanded(
                  child: TextField(
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      decoration: InputDecoration(
                          counterText: detailsController.detailsTextCounter.value
                              .toString()),
                      style: TextStyle(decoration: TextDecoration.none)),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor: AppColors.colorAccent,
              elevation: 24,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: detailsController.bottomNavigationIndex.value,
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
                    icon: Icon(Icons.circle, color: Colors.grey),
                    activeIcon: Icon(Icons.circle, color: Colors.grey),
                    label: "grey",
                    backgroundColor: Colors.grey),
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
                detailsController.bottomNavigationIndex.value = index;
                _getBackgroundColor(index);
              },
            ))
        // child: const TextField(
        //   showCursor: true,
        //   autocorrect: true,
        //   cursorColor: Colors.blue,
        //
        // ),
        );
  }

  Color _getBackgroundColor(int index) {
    Color color = Colors.white;
    switch (index) {
      case 0:
        color = Colors.white;
        break;
      case 1:
        color = Colors.grey;
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
