// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class UniversityFull extends StatelessWidget {
//   final String title, text2, text3, text4;
//   const UniversityFull(
//       {Key? key,
//       required this.title,
//       required this.text2,
//       required this.text3,
//       required this.text4})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 228, 227, 227),
//         body: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 200,
//                   color: Colors.white,
//                   child: Image.asset('assets/univ1.png', fit: BoxFit.cover),
//                 ),
//                 Positioned(
//                   top: 16,
//                   left: 16,
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   top: 120,
//                   child: Center(
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 35,
//                       child: Image.asset(
//                         'assets/univlogo.png',
//                         scale: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               width: double.infinity,
//               height: 140,
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       title,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: GoogleFonts.alkatra(
//                         textStyle: const TextStyle(
//                             fontSize: 20,
//                             color: Color.fromARGB(255, 71, 70, 70),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Text(
//                       text2,
//                       style: GoogleFonts.alkatra(
//                         textStyle: const TextStyle(
//                             fontSize: 18,
//                             color: Color.fromARGB(255, 149, 148, 148),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Text(
//                       text3,
//                       style: GoogleFonts.alkatra(
//                         textStyle: const TextStyle(
//                             fontSize: 14,
//                             color: Color.fromARGB(255, 149, 148, 148),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Text(
//                       text4,
//                       style: GoogleFonts.alkatra(
//                         textStyle: const TextStyle(
//                             fontSize: 14,
//                             color: Color.fromARGB(255, 149, 148, 148),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 top: 10,
//                 left: 10,
//                 right: 10,
//               ),
//               child: Container(
//                 width: double.infinity,
//                 height: 130,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Artificial Intelligence',
//                         style: GoogleFonts.alkatra(
//                           textStyle: const TextStyle(
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 149, 148, 148),
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Text(
//                         "Rs.5,40,000",
//                         style: GoogleFonts.alkatra(
//                           textStyle: const TextStyle(
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 149, 148, 148),
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       ElevatedButton(
//                           onPressed: () {},
//                           child: const Text("Book Admission")),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UniversityFull extends StatelessWidget {
  final String title, text2, text3, text4;
  final List<Map<String, String>> courses = [
    {
      'courseName': 'Artificial Intelligence',
      'coursePrice': 'Rs.5,40,000',
    },
    {
      'courseName': 'Web Development',
      'coursePrice': 'Rs.3,80,000',
    },
    {
      'courseName': 'Data Science',
      'coursePrice': 'Rs.4,50,000',
    },
    {
      'courseName': 'Mobile App Development',
      'coursePrice': 'Rs.4,20,000',
    },
    {
      'courseName': 'Digital Marketing',
      'coursePrice': 'Rs.3,00,000',
    },
    {
      'courseName': 'Machine Learning',
      'coursePrice': 'Rs.5,20,000',
    },
    {
      'courseName': 'UX/UI Design',
      'coursePrice': 'Rs.3,60,000',
    },
    {
      'courseName': 'Blockchain Technology',
      'coursePrice': 'Rs.4,80,000',
    },
    {
      'courseName': 'Cloud Computing',
      'coursePrice': 'Rs.4,70,000',
    },
    {
      'courseName': 'Game Development',
      'coursePrice': 'Rs.4,00,000',
    },
  ];

  UniversityFull(
      {Key? key,
      required this.title,
      required this.text2,
      required this.text3,
      required this.text4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 241, 241),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  color: Colors.white,
                  child: Image.asset('assets/univ1.png', fit: BoxFit.cover),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 100,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: Image.asset(
                        'assets/univlogo.png',
                        scale: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 140,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.alkatra(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 71, 70, 70),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      text2,
                      style: GoogleFonts.alkatra(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 149, 148, 148),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      text3,
                      style: GoogleFonts.alkatra(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 149, 148, 148),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      text4,
                      style: GoogleFonts.alkatra(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 149, 148, 148),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Courses Offered',
              style: GoogleFonts.alkatra(
                textStyle: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 86, 147, 227),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              courses[index]['courseName']!,
                              style: GoogleFonts.alkatra(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 88, 87, 87),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              courses[index]['coursePrice']!,
                              style: GoogleFonts.alkatra(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 149, 148, 148),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text("Book Admission")),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
