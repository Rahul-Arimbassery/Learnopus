import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/1.png'),
        Column(
          children: [
            Text(
              'Global Educational Network',
              style: GoogleFonts.alata(
                textStyle: const TextStyle(fontSize: 19, color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Discover 🔸 Learn 🔸 Connect',
              style: GoogleFonts.alata(
                textStyle: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
