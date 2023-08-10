import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnopus/View/errormessages/signin_out_error.dart';
import 'package:learnopus/view/navigationpage/screen/navigation_view.dart';

class SigninHelper {
  static void signin(BuildContext context, String email, String password) {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password).then((_) {
      Navigator.of(context)
          .pushReplacement(
              MaterialPageRoute(builder: (context) => const NavigationPage()))  ////NavigationPage
          .catchError((error) {
        handleNavigationError(error);
      });
    }).catchError((error) {
      handleSignInError(error);
    });
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:learnopus/View/errormessages/signin_out_error.dart';
// import 'package:learnopus/View/profile/screens/profiledetails.dart';
// import 'package:learnopus/view/navigationpage/screen/navigation_view.dart';

// class SigninHelper {
//   static void signin(BuildContext context, String email, String password) {
//     final auth = FirebaseAuth.instance;
//     auth.signInWithEmailAndPassword(email: email, password: password).then((_) {
//       final currentUser = auth.currentUser;
//       if (currentUser != null) {
//         // User is already logged in, navigate to the main navigation screen.
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const NavigationPage()),
//         ).catchError((error) {
//           handleNavigationError(error);
//         });
//       } else {
//         // First-time user, navigate to the profile enter screen.
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const ProfileEnterScreen()),
//         ).catchError((error) {
//           handleNavigationError(error);
//         });
//       }
//     }).catchError((error) {
//       handleSignInError(error);
//     });
//   }
// }
