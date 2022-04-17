import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/notes/model/Note.dart';
import 'package:to_do_app_flutter/notes/view/NotesDetailsScreen.dart';
import 'package:to_do_app_flutter/notes/viewmodel/NotesViewModel.dart';
import 'package:to_do_app_flutter/notes/viewmodel/SharedViewModel.dart';
import 'package:to_do_app_flutter/utils/AppColor.dart';

class NotesWidget extends StatelessWidget {
  NotesWidget({Key? key}) : super(key: key);

  final NotesViewModel _notesViewModel = Get.find();
  final SharedViewModel _sharedViewModel = Get.put(SharedViewModel());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _notesViewModel.getNotes(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: LoadingIndicator(size: 50, borderWidth: 5));
            // Text("Loading");
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text(
              'Your Notes Are Empty',
              style: TextStyle(color: Colors.black),
            ));
          }

          return GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> note =
                  document.data() as Map<String, dynamic>;
              return InkWell(
                onTap: () {
                  _sharedViewModel.selectedNote.value = Note.sec(
                      title: note["title"],
                      desc: note["desc"],
                      createdAt: (note["createdAt"] as Timestamp).toDate(),
                      lastEdit: (note["lastEdit"] as Timestamp).toDate(),
                      backgroundColorIndex: note["backgroundColorIndex"],
                      pinned: note["pinned"]);
                  Get.to(() => NotesDetailsWidget());
                },
                child: Card(
                  color: AppColors.getBackgroundColor(
                      note["backgroundColorIndex"]),
                  margin: const EdgeInsets.all(16),
                  elevation: 16,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: ListTile(
                    title: Text(note["title"],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(note["desc"], maxLines: 4, softWrap: true),
                    textColor: Colors.black,
                  ),
                ),
              );
            }).toList(),
          );
        });
  }
}
