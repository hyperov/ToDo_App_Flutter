import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app_flutter/database/Crud.dart';
import 'package:to_do_app_flutter/database/Database.dart';
import 'package:to_do_app_flutter/notes/model/Note.dart';

class NotesRepo {
  Future<DocumentReference> addNote(String userId, Note note) =>
      Crud.addDocumentToSubCollection(
          collectionName: Database.collectionUsers,
          docId: userId,
          subCollectionName: Database.collectionNotes,
          model: note);

  Future<void> updateNote(String userId, String subDocId, Note note) =>
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
