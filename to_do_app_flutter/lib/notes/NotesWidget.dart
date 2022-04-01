import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/notes/Note.dart';
import 'package:to_do_app_flutter/notes/NotesViewModel.dart';

class NotesWidget extends StatelessWidget {
  NotesWidget({Key? key}) : super(key: key);

  final NotesViewModel _notesViewModel = Get.put(NotesViewModel());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        initialData: _notesViewModel.getNotes(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator(size: 50, borderWidth: 15);
            // Text("Loading");
          }

          if (snapshot.isBlank!) {
            return const Text('Your Notes Are Empty');
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Note note = document.data()! as Note;
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.desc),
                textColor: Colors.black12,
              );
            }).toList(),
          );
        }
    );
  }
}
