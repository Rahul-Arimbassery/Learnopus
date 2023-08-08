import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnopus/View/otppage/screens/otppage_view.dart';

void onTabTapped(BuildContext context, int index, PageController pageController) {
  pageController.animateToPage(
    index,
    duration: const Duration(milliseconds: 300),
    curve: Curves.ease,
  );
}

void onPageChanged(int index, Function(int) setCurrentIndex) {
  setCurrentIndex(index);
}

void logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
  // Navigate to your login page
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => OtpPage(), // Replace with your login page
    ),
  );
}
