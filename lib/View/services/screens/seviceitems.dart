import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnopus/view/services/screens/university/country.dart';
import 'package:learnopus/view/services/screens/university/universitypage.dart';


class ServiceItems extends StatelessWidget {
  const ServiceItems({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    required this.path,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  final double containerHeight;
  final double containerWidth;
  final String path;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UniversityPage(),
                )),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      height: containerHeight,
                      width: containerWidth,
                      child: Image.asset(
                        path,
                        scale: 4,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: containerHeight,
                      width: containerWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              text1,
                              style: GoogleFonts.alkatra(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 181, 179, 179),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              text2,
                              style: GoogleFonts.alkatra(
                                textStyle: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              text3,
                              style: GoogleFonts.alkatra(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 143, 141, 141),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
