import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static const String collectionUsers ='users';
  static const String collectionNotes ='notes';
  // static const String user_unique_ID ='id';

  static CollectionReference getCollection(String collectionName) =>
      _db.collection(collectionName);

  static DocumentReference getDoc({required String collectionName, required String docId}) =>
      getCollection(collectionName).doc(docId);

  static CollectionReference getSubCollection(DocumentReference documentReference,String subCollectionName) =>
      documentReference.collection(subCollectionName);

  // createOrUpdateOrOverrideDocumentByDocReference({required String collectionName, required String docId}) {
  //   getDoc(collectionName:collectionName,docId:docId).set(data)
  // }
}
