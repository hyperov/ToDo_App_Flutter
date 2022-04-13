import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app_flutter/database/Crud.dart';
import 'package:to_do_app_flutter/database/Database.dart';
import 'package:to_do_app_flutter/notes/model/Note.dart';

class NotesRepo {
  Future<DocumentReference> addNote(String userId, Note note) {
    Map<String, dynamic> noteMap = {
      "title": note.title,
      "desc": note.desc,
      "pinned": note.pinned,
      "backgroundColorIndex": note.backgroundColorIndex,
      "createdAt": note.createdAt,
      "lastEdit": note.lastEdit
    };
    return Crud.addDocumentToSubCollection(
        collectionName: Database.collectionUsers,
        docId: userId,
        subCollectionName: Database.collectionNotes,
        model: noteMap);
  }

  Future<void> updateNote(String userId, String subDocId, dynamic note) =>
      Crud.updateDocumentToSubCollection(
          collectionName: Database.collectionUsers,
          docId: userId,
          subCollectionName: Database.collectionNotes,
          subDocId: subDocId,
          model: note);

  Stream<QuerySnapshot> getNotes(String userId) =>
      Crud.getAllDocumentsOfSubCollection(
          collectionName: Database.collectionUsers,
          docId: userId,
          subCollectionName: Database.collectionNotes);
}
