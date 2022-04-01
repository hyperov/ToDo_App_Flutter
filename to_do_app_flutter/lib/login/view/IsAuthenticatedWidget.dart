import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/base/Auth.dart';
import 'package:to_do_app_flutter/login/viewmodel/AuthViewModel.dart';
import 'package:to_do_app_flutter/database/Crud.dart';
import 'package:to_do_app_flutter/database/Database.dart';

import '../../home/view/HomeScreen.dart';

class IsSignedInWidget extends StatelessWidget {
  IsSignedInWidget({Key? key}) : super(key: key);

  final AuthViewModel _authViewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        // If the user is already signed-in, use it as initial data
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, snapshot) {
          // User is not signed in
          if (!snapshot.hasData) {
            return SignInScreen(
                auth: FirebaseAuth.instance,
                providerConfigs: const [
                  EmailProviderConfiguration(),
                  PhoneProviderConfiguration(),
                  GoogleProviderConfiguration(
                      clientId:
                      "89675534559-bqv4i40l71an20h6hr5m2dufnh84f71o.apps.googleusercontent.com"),
                ]);
          }

          // Render your application if authenticated
          _authViewModel.insertUserToDatabase(snapshot.data);

         return  HomeScreen();
        }
    );
  }
}
