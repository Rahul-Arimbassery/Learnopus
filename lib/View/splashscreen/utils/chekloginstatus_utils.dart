import 'package:flutter/material.dart';
import 'package:learnopus/View/profile/screens/profiledetails.dart';
import 'package:learnopus/ViewModel/provider/auth_status_provider.dart';
import 'package:learnopus/view/otppage/screens/otppage_view.dart';
import 'package:provider/provider.dart';

class LoginChecker {
  static Future<void> checkAndNavigate(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.currentUser;
    await Future.delayed(const Duration(seconds: 3));

    if (user == null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OtpPage(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  ProfileEnterScreen(),
        ),
      );
    }
  }
}
