import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnopus/ViewModel/provider/otppagemodel_provider.dart';
import 'package:provider/provider.dart';
import '../utils/authcontainerdetails_utils.dart';

// ignore: must_be_immutable
class OtpPage extends StatelessWidget {
  OtpPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final PageController _pageController = PageController();
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
                            emailController.clear();
                            passwordController.clear();
                          },
                          children: [
                            authContainerFirst(otpPageModel, _pageController,emailController, passwordController),
                            authContainerSecond(otpPageModel, _pageController,emailController, passwordController),
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
