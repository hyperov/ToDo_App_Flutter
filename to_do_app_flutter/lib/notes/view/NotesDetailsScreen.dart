import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/notes/model/Note.dart';
import 'package:to_do_app_flutter/notes/viewmodel/NotesDetailsViewModel.dart';
import 'package:to_do_app_flutter/utils/AppColor.dart';

class NotesDetailsWidget extends StatelessWidget {
  NotesDetailsWidget({Key? key}) : super(key: key);

  final NotesDetailsViewModel detailsController =
      Get.put(NotesDetailsViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            _getBackgroundColor(detailsController.bottomNavigationIndex.value),
        appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                })),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                enableInteractiveSelection: true,
                buildCounter: (context,
                    {required currentLength, required isFocused, maxLength}) {
                  return Text(
                    "${currentLength.toInt()}",
                    style: const TextStyle(decoration: TextDecoration.none),
                  );
                },
                style: const TextStyle(
                  decoration: TextDecoration.none,
                ),
                decoration: const InputDecoration(
                    isDense: true,
                    prefixText: "Title: ",
                    prefixStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.teal,
                            width: 3,
                            style: BorderStyle.solid))),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: TextField(
                    textInputAction: TextInputAction.done,
                    textAlignVertical: TextAlignVertical.top,
                    enableInteractiveSelection: true,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    onChanged: (String text) =>
                        detailsController.textChanges.value = true,
                    buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) {
                      return Text(
                        "${currentLength.toInt()}",
                        style: const TextStyle(decoration: TextDecoration.none),
                      );
                    },
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal,
                                width: 3,
                                style: BorderStyle.solid))),
                    style: const TextStyle(decoration: TextDecoration.none)),
              ),
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
                activeIcon: Icon(Icons.circle, color: Colors.deepOrangeAccent),
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: FloatingActionButton(
            focusElevation: 16,
            highlightElevation: 32,
            child: Icon(Icons.add),
            tooltip: "save",
            splashColor: _getBackgroundColor(
                detailsController.bottomNavigationIndex.value),
            onPressed: () {
              if (detailsController.textChanges.isFalse) {
                detailsController.addNote(
                  Note(
                      title: detailsController.title.value,
                      desc: detailsController.desc.value,
                      createdAt: DateTime.now(),
                      lastEdit: DateTime.now(),
                      backgroundColorIndex:
                          detailsController.bottomNavigationIndex.value),
                );
              }else{

              }
            },
          ),
        ),
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
