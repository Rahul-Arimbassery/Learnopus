import 'package:flutter/material.dart';
import 'package:learnopus/View/navigationpage/utils/navigation_utils.dart';

class SettingsItems extends StatelessWidget {
  const SettingsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 62, 128, 208),
      body: Center(
        child: IconButton(
          onPressed: () {
            logout(context);
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
