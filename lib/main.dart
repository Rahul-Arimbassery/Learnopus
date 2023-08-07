import 'package:flutter/material.dart';
import 'package:learnopus/view/otppage/otppage_view.dart';
import 'package:learnopus/view/navigationpage/navigation_view.dart';
import 'package:learnopus/view/splashscreen/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashAndNavigate(),
    );
  }
}

class SplashAndNavigate extends StatefulWidget {
  const SplashAndNavigate({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashAndNavigateState createState() => _SplashAndNavigateState();
}

class _SplashAndNavigateState extends State<SplashAndNavigate> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 3));
    if (user == null) {
      // User is not signed in, navigate to the OTP page

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OtpPage(),
        ),
      );
    } else {
      // User is signed in, navigate to the home page
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 62, 128, 208),
      body: Splash(), // Replace with your custom splash screen widget.
    );
  }
}
