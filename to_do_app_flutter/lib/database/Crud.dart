import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app_flutter/database/Database.dart';
import 'package:to_do_app_flutter/notes/Note.dart';

class Crud {
  static Future<void> createOrUpdateOrOverrideSpecificDocumentByDocReference(
      {required String collectionName,
      required String docId,
      required Map<String, dynamic> model}) {
    return Database.getDoc(collectionName: collectionName, docId: docId)
        .set(model);
  }

  static Future<DocumentReference> addDocumentToCollection(
      {required String collectionName, required Map<String, dynamic> model}) {
    return Database.getCollection(collectionName).add(model);
  }

  static Future<DocumentReference> addDocumentToSubCollection(
      {required String collectionName,
      required String docId,
      required String subCollectionName,
      required dynamic model}) {
    return Database.getSubCollection(
            Database.getDoc(collectionName: collectionName, docId: docId),
            subCollectionName)
        .add(model);
  }

  static Future<void> updateDocumentToCollection(
      {required String collectionName,
      required String docId,
      required Map<String, dynamic> model}) {
    return Database.getDoc(collectionName: collectionName, docId: docId)
        .update(model);
  }

  static Future<void> updateDocumentToSubCollection(
      {required String collectionName,
      required String docId,
      required String subCollectionName,
      required String subDocId,
      required dynamic model}) {
    return Database.getSubCollection(
            Database.getDoc(collectionName: collectionName, docId: docId),
            subCollectionName)
        .doc(subDocId)
        .update(model);
  }

  static Stream<QuerySnapshot> getAllDocumentsOfSubCollection( {required String collectionName,
    required String docId,
    required String subCollectionName}){
    return Database.getSubCollection(
        Database.getDoc(collectionName: collectionName, docId: docId),
        subCollectionName).snapshots();
  }
}
