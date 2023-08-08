import 'package:flutter/material.dart';
import 'package:learnopus/View/splashscreen/screen/splash_view.dart';
import 'package:learnopus/View/splashscreen/utils/chekloginstatus_utils.dart';

class SplashAndNavigate extends StatelessWidget {
  const SplashAndNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    LoginChecker.checkAndNavigate(context);

    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 62, 128, 208),
      body: Splash(), // Replace with your custom splash screen widget.
    );
  }
}
