import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/base/Auth.dart';
import 'package:to_do_app_flutter/notes/model/NotesRepo.dart';

import '../model/Note.dart';

class NotesDetailsViewModel extends GetxController {

  final NotesRepo _notesRepo = Get.put(NotesRepo());

  RxString insertDocId = "".obs;
  RxInt bottomNavigationIndex = 0.obs;
  RxInt titleTextCounter = 0.obs;
  RxInt detailsTextCounter = 0.obs;

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

}
