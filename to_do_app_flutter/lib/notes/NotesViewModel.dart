import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/base/Auth.dart';
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

  addNote(Note note) {
    Future<DocumentReference<Object?>> notesRef =
        _notesRepo.addNote(Auth.instance.currentUser!.uid, note);
    notesRef.then((DocumentReference value) {
      insertDocId.value = value.id;
      printInfo(info: "note is successfully inserted");
    }, onError: (err) => printError(info: "note insert error : $err"));
  }

   getNotes()  => _notesRepo.getNotes(Auth.instance.currentUser!.uid);
// notesRef.then((DocumentReference value) {
//   insertDocId.value = value.id;
//   printInfo(info: "note is successfuly inserted");
// }, onError: (err) => printError(info: "note insert error : $err"));

}
