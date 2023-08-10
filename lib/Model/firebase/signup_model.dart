import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learnopus/View/errormessages/signin_out_error.dart';
import 'package:learnopus/View/profile/screens/profiledetails.dart';

class SignupHelper {
  static void signup(BuildContext context, String email, String password) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProfileEnterScreen()),
      );
    }).catchError((error) {
      if (error.code == 'email-already-in-use') {
          // Handle the case where the email is already in use.
          // You can show an error message to the user in this case.
          handleSignInError(error.code);
        } else {
          // Handle other FirebaseAuthException errors.
          handleSignInError(error);
        }
    });
  }
}


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:learnopus/View/errormessages/signin_out_error.dart';
// import 'package:learnopus/View/profile/screens/profiledetails.dart';
// import 'package:learnopus/view/navigationpage/screen/navigation_view.dart';

// class SignupHelper {
//   static void signup(BuildContext context, String email, String password) {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     auth
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((_) {
//           final currentUser = auth.currentUser;
//           if(currentUser != null){
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const NavigationPage()),
//         ).catchError((error) {
//           handleNavigationError(error);
//         });
//           }else{
//               Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const ProfileEnterScreen()),
//         ).catchError((error) {
//           handleNavigationError(error);
//         });
//           }

//     });
//   }
// }
