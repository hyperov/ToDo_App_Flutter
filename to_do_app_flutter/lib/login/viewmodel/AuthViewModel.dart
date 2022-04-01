import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/base/Auth.dart';
import 'package:to_do_app_flutter/database/Crud.dart';
import 'package:to_do_app_flutter/database/Database.dart';

class AuthViewModel extends GetxController {
  // RxBool isCurrentUserExist = false.obs;

  Future<bool> _isCurrentUserNotExists() async {
    return await Database.getDoc(
            collectionName: Database.collectionUsers,
            docId: Auth.instance.currentUser!.uid)
        .get()
        .asStream()
        .isEmpty;
  }

  insertUserToDatabase(User? user) async {
    //create user first time or override fields
    bool userNotExist = await _isCurrentUserNotExists();
    if (userNotExist) {
      return Crud.createOrUpdateOrOverrideSpecificDocumentByDocReference(
          collectionName: Database.collectionUsers,
          docId: user!.uid,
          model: {
            'id': user.uid,
            'displayName': user.displayName,
            'photoUrl': user.photoURL,
            'bio': '',
            'email': user.email,
            'emailVerified': user.emailVerified,
            'isAnonymous': user.isAnonymous,
            'phoneNumber': user.phoneNumber,
            'creationTime': user.metadata.creationTime,
            'lastSignInTime': user.metadata.lastSignInTime,
          }).then((value) => print("insert user first time success"),
          onError: (err) => printError(info: "insert user first time error $err"));
    } else {
      return Crud.createOrUpdateOrOverrideSpecificDocumentByDocReference(
          collectionName: Database.collectionUsers,
          docId: user!.uid,
          model: {
            'id': user.uid,
            'displayName': user.displayName,
            'photoUrl': user.photoURL,
            'email': user.email,
            'emailVerified': user.emailVerified,
            'isAnonymous': user.isAnonymous,
            'phoneNumber': user.phoneNumber,
            'lastSignInTime': user.metadata.lastSignInTime,
          }).then((value) => print("insert first time success"),
          onError: (err) => printError(info: "insert first time error $err"));
    }
  }

  @override
  void onReady() {
    super.onReady();
    Auth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    }, onError: (err) {
      print("login error : " + err);
    });
  }
}
