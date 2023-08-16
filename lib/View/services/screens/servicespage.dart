import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnopus/view/services/screens/seviceitems.dart';


class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth =
        (screenWidth - 70) / 2; // Subtracting padding and SizedBox
    const containerHeight = 150.0; // You can adjust this as needed

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 232, 232),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Text(
                  'Explore Universities & Courses',
                  style: GoogleFonts.alkatra(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 158, 154, 154),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ServiceItems(
                containerHeight: containerHeight,
                containerWidth: containerWidth,
                path: 'assets/university.png',
                text1: '1000+',
                text2: 'Universities',
                text3: 'Explore>',
              ),
              ServiceItems(
                containerHeight: containerHeight,
                containerWidth: containerWidth,
                path: 'assets/collegecourses.png',
                text1: 'Check',
                text2: 'Ranking',
                text3: 'Explore>',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


