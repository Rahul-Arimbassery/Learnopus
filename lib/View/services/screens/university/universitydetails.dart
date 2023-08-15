import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnopus/view/services/screens/university/universityfull.dart';

class UniversityDetails extends StatelessWidget {
  const UniversityDetails({
    super.key,
    required this.path,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  final String path;
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        path,
                        scale: 10,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Text(
                          text1,
                          overflow: TextOverflow
                              .ellipsis, // Show ellipsis when text overflows
                          maxLines: 2, // Display only one line of text
                          style: GoogleFonts.alata(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 14, 14, 14),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      const Icon(Icons.place),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          text2,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.alata(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 170, 168, 168),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      const Icon(Icons.link),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          text3,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.alata(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 170, 168, 168),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      const Icon(Icons.location_city),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          text4,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.alata(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 170, 168, 168),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'explore university details here',
                        style: GoogleFonts.alata(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 205, 202, 202),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UniversityFull(
                                  title: text1,
                                  text2: text2,
                                  text3: text3,
                                  text4: text4,
                                ),
                              ));
                        },
                        child: const SizedBox(
                          child: Text("Explore"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
