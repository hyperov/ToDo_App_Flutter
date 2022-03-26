import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/auth.dart';

import '../home/HomeScreen.dart';

class IsSignedInWidget extends StatelessWidget {
  const IsSignedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    }, onError: (err) {
      print("login error : " + err);
    });
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
        return const HomeScreen(title: 'Flutter Demo Home Page');
      },
    );
  }
}
