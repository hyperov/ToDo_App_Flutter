import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/auth.dart';

import 'MyHomePage.dart';
class IsAuthenticatedWidget extends StatelessWidget {
  const IsAuthenticatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // If the user is already signed-in, use it as initial data
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return const SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(clientId: "89675534559-bqv4i40l71an20h6hr5m2dufnh84f71o.apps.googleusercontent.com"),
                PhoneProviderConfiguration(),
              ]
          );
        }

        // Render your application if authenticated
        return const MyHomePage(title: 'Flutter Demo Home Page');
      },
    );
  }
}
