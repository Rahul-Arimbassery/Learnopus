import 'package:flutter/material.dart';
import 'package:learnopus/view_models/firebase/signin_view_model.dart';
import 'package:learnopus/view_models/firebase/signup_view_model.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class AuthContainer extends StatelessWidget {
  final String title;
  final String hintText;
  final Icon prefixIcon;
  final String additionalHintText;
  final Icon additionalIcon;
  final String thirdHintText;
  final Icon thirdIcon;
  final bool confirmPassword;
  final bool showGoogleSignIn;
  final int currentPageIndex;
  final PageController pageController;

  const AuthContainer({
    super.key,
    required this.title,
    required this.hintText,
    required this.prefixIcon,
    this.additionalHintText = "",
    required this.additionalIcon,
    this.confirmPassword = false,
    this.showGoogleSignIn = false,
    required this.currentPageIndex,
    required this.pageController,
    required this.thirdHintText,
    required this.thirdIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon: prefixIcon,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            if (additionalHintText.isNotEmpty) ...[
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: additionalHintText,
                      prefixIcon: additionalIcon,
                      border: InputBorder.none,
                    ),
                    obscureText: !confirmPassword,
                  ),
                ),
              ),
            ],
            if (thirdHintText.isNotEmpty) ...[
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: thirdHintText,
                      prefixIcon: thirdIcon,
                      border: InputBorder.none,
                    ),
                    obscureText: false, // Adjust this based on your needs
                  ),
                ),
              ),
            ],
            if (confirmPassword) ...[
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20,
                      ),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity, // Make the button full width
                height: 50, // Set the desired height
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text; // Get the email
                    String password =
                        passwordController.text; // Get the password
                    if (currentPageIndex == 1) {
                      SignupHelper.signup(context, email, password);
                    } else if (currentPageIndex == 0) {
                      SigninHelper.signin(context, email, password);
                    } // Call SignupHelper
                  },
                  child: Text(
                    title,
                  ), // Display title as button text
                ),
              ),
            ),
            if (showGoogleSignIn) ...[
              const SizedBox(height: 20), // Add spacing
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle Sign in with Google action
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/google_logo.png', // Replace with your image asset
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(width: 8),
                      const Text('Sign in with Google'),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Swipe to the next page
                if (currentPageIndex == 0) {
                  pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                } else if (currentPageIndex == 1) {
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }
              },
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (currentPageIndex == 0) {
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    } else if (currentPageIndex == 1) {
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentPageIndex == 0
                              ? "Don't have an account? " // Add space after the question mark
                              : "Already have an account? ",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 139, 147, 155),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: currentPageIndex == 0 ? "Sign Up" : "Sign In",
                          style: const TextStyle(
                            color: Colors
                                .blue, // Change color for the dynamic part
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
