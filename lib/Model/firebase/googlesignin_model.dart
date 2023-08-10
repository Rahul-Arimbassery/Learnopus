import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnopus/View/errormessages/signin_out_error.dart';
import 'package:learnopus/View/navigationpage/screen/navigation_view.dart';
import 'package:learnopus/View/profile/screens/profiledetails.dart';



Future<void> signinWithGoogle({required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      // ignore: unused_local_variable
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  NavigationPage()), //ProfileEnterScreen
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        // Handle error
        showToast('Account exists with different credential');
      } else if (e.code == 'invalid-credential') {
        // Handle error
        showToast('Invalid credential');
      }
    } catch (e) {
      showToast('Something else');
    }
  }
}
