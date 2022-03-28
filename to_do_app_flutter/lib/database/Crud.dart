import 'package:to_do_app_flutter/database/Database.dart';

class Crud {
  static Future<void> createOrUpdateOrOverrideDocumentByDocReference(
      {required String collectionName,
      required String docId,
      required Map<String, dynamic> model}) {
    return Database.getDoc(collectionName: collectionName, docId: docId)
        .set(model);
  }
}
