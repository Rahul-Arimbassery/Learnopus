import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void handleSignInError(dynamic error) {
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

void handleNavigationError(dynamic error) {
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

String getCoreErrorMessage(dynamic error) {
  if (error is FirebaseAuthException) {
    return error.message ?? "Unknown error";
  } else {
    return error.toString().split(':')[0].trim();
  }
}


void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black45,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

class ToastUtils {
  static void showErrorMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: const Color.fromARGB(255, 62, 128, 208),
    );
  }
}