import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnopus/view/navigationpage/navigation_view.dart';

class SigninHelper {
  static void signin(BuildContext context, String email, String password) {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password).then((_) {
      Navigator.of(context)
          .pushReplacement(
              MaterialPageRoute(builder: (context) => const NavigationPage()))
          .catchError((error) {
        handleNavigationError(error);
      });
    }).catchError((error) {
      handleSignInError(error);
    });
  }

  static void handleSignInError(dynamic error) {
    String errorMessage = getCoreErrorMessage(error);

    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 62, 128, 208),
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }

  static void handleNavigationError(dynamic error) {
    String errorMessage = getCoreErrorMessage(error);

    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 62, 128, 208),
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }

  static String getCoreErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      return error.message ?? "Unknown error";
    } else {
      return error.toString().split(':')[0].trim();
    }
  }
}


