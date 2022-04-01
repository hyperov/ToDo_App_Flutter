import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/notes/NotesRepo.dart';

import 'Note.dart';

class NotesViewModel extends GetxController {
  final NotesRepo _notesRepo = Get.put(NotesRepo());
  RxString insertDocId = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  addNote(String userId, Note note) {
    Future<DocumentReference<Object?>> notesRef =
        _notesRepo.addNote(userId, note);
    notesRef.then((DocumentReference value) {
      insertDocId.value = value.id;
      printInfo(info: "note is successfuly inserted");
    }, onError: (err) => printError(info: "note insert error : $err"));
  }

  getNotes(String userId, Note note) {
    Future<DocumentReference<Object?>> notesRef =
    _notesRepo.addNote(userId, note);
    notesRef.then((DocumentReference value) {
      insertDocId.value = value.id;
      printInfo(info: "note is successfuly inserted");
    }, onError: (err) => printError(info: "note insert error : $err"));
  }
}
