import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 62, 128, 208),
      body: Center(
          child: Text(
        'Create your Post',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      )),
    );
  }
}
