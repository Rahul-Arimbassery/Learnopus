import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learnopus/View/splashscreen/screen/splashandnavigate.dart';
import 'package:learnopus/ViewModel/provider/auth_status_provider.dart';
import 'package:learnopus/ViewModel/provider/dropdoen_provider.dart';
import 'package:learnopus/ViewModel/provider/imagemodel_provider.dart';
import 'package:learnopus/ViewModel/provider/otppagemodel_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => OtpPageModel()),
        ChangeNotifierProvider(create: (context) => ImageProviderModel()),
        ChangeNotifierProvider(create: (context) => DropdownModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashAndNavigate(),
      ),
    );
  }
}
