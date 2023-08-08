// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:learnopus/ViewModel/auth_viewmodel.dart';
// import 'package:learnopus/view/otppage/screens/auth_conatiner.dart';

// class OtpPage extends StatefulWidget {
//   const OtpPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _OtpPageState createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {
//   final PageController _pageController = PageController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   int _currentPageIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       setState(() {
//         _currentPageIndex = _pageController.page!.round();
//       });
//     });
//     emailController.clear();
//     passwordController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double containerHeight = screenHeight * 0.6;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 62, 128, 208),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Image.asset(
//                 'assets/1.png',
//                 scale: 2,
//               ),
//             ),
//             Text(
//               'Global Educational Network',
//               style: GoogleFonts.alata(
//                 textStyle: const TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Expanded(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   height: containerHeight,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(25),
//                       topRight: Radius.circular(25),
//                     ),
//                     color: Colors.white,
//                   ),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: PageView(
//                           controller: _pageController,
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             AuthContainer(
//                               model: AuthContainerModel(
//                                 title: "Sign In",
//                                 hintText: "Enter Email",
//                                 prefixIcon: const Icon(
//                                   Icons.email,
//                                   size: 20,
//                                 ),
//                                 additionalHintText: "Enter Password",
//                                 additionalIcon: const Icon(
//                                   Icons.lock,
//                                   size: 20,
//                                 ),
//                                 thirdHintText: "",
//                                 thirdIcon: const Icon(
//                                   Icons.lock,
//                                   size: 20,
//                                 ),
//                                 showGoogleSignIn: true,
//                                 confirmPassword: false,
//                                 currentPageIndex: _currentPageIndex,
//                                 pageController: _pageController,
//                                 emailController: emailController,
//                                 passwordController: passwordController,
//                               ),
//                             ),
//                             AuthContainer(
//                               model: AuthContainerModel(
//                                 title: "Sign Up",
//                                 hintText: "Enter Email",
//                                 prefixIcon: const Icon(
//                                   Icons.email,
//                                   size: 20,
//                                 ),
//                                 additionalHintText: "Enter Password",
//                                 additionalIcon: const Icon(
//                                   Icons.lock,
//                                   size: 20,
//                                 ),
//                                 thirdHintText: "Enter Username",
//                                 thirdIcon: const Icon(
//                                   Icons.person,
//                                   size: 20,
//                                 ),
//                                 showGoogleSignIn: false,
//                                 confirmPassword: false,
//                                 currentPageIndex: _currentPageIndex,
//                                 pageController: _pageController,
//                                 emailController: emailController,
//                                 passwordController: passwordController,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       _buildPageIndicator(),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnopus/ViewModel/auth_viewmodel.dart';
import 'package:learnopus/ViewModel/provider/otppagemodel_provider.dart';
import 'package:learnopus/view/otppage/screens/auth_conatiner.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OtpPage extends StatelessWidget {
  OtpPage({super.key});

  final PageController _pageController = PageController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

  int currentPageIndex = 0;

  // @override
  @override
  Widget build(BuildContext context) {
    OtpPageModel otpPageModel = Provider.of<OtpPageModel>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight * 0.6;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 62, 128, 208),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/1.png',
                scale: 2,
              ),
            ),
            Text(
              'Global Educational Network',
              style: GoogleFonts.alata(
                textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: containerHeight,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index) {
                            otpPageModel.updateCurrentPageIndex(index);
                            currentPageIndex = index;
                          },
                          children: [
                            AuthContainer(
                              model: AuthContainerModel(
                                title: "Sign In",
                                hintText: "Enter Email",
                                prefixIcon: const Icon(
                                  Icons.email,
                                  size: 20,
                                ),
                                additionalHintText: "Enter Password",
                                additionalIcon: const Icon(
                                  Icons.lock,
                                  size: 20,
                                ),
                                thirdHintText: "",
                                thirdIcon: const Icon(
                                  Icons.lock,
                                  size: 20,
                                ),
                                showGoogleSignIn: true,
                                confirmPassword: false,
                                //currentPageIndex: _currentPageIndex,
                                currentPageIndex: otpPageModel.currentPageIndex,
                                pageController: _pageController,
                                emailController: emailController,
                                passwordController: passwordController,
                              ),
                            ),
                            AuthContainer(
                              model: AuthContainerModel(
                                title: "Sign Up",
                                hintText: "Enter Email",
                                prefixIcon: const Icon(
                                  Icons.email,
                                  size: 20,
                                ),
                                additionalHintText: "Enter Password",
                                additionalIcon: const Icon(
                                  Icons.lock,
                                  size: 20,
                                ),
                                thirdHintText: "Enter Username",
                                thirdIcon: const Icon(
                                  Icons.person,
                                  size: 20,
                                ),
                                showGoogleSignIn: false,
                                confirmPassword: false,
                                //currentPageIndex: _currentPageIndex,
                                currentPageIndex: otpPageModel.currentPageIndex,
                                pageController: _pageController,
                                emailController: emailController,
                                passwordController: passwordController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildPageIndicator(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIndicatorCircle(0),
        _buildIndicatorCircle(1),
      ],
    );
  }

  Widget _buildIndicatorCircle(int pageIndex) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPageIndex == pageIndex ? Colors.blue : Colors.grey,
      ),
    );
  }
}