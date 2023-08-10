import 'package:flutter/material.dart';

class UniversityPage extends StatelessWidget {
  const UniversityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 62, 128, 208),
      body: Center(
          child: Text(
        'University Page - Details Comes Here',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      )),
    );
  }
}
