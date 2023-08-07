import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learnopus/view/otppage/otppage_view.dart';

class SignupHelper {
  static void signup(BuildContext context, String email, String password) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OtpPage()),
      );
    });
  }
}


