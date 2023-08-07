import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnopus/view_models/firebase/signin_view_model.dart';
import 'package:learnopus/view_models/firebase/signup_view_model.dart';

class AuthContainer extends StatefulWidget {
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
  final TextEditingController emailController;
  final TextEditingController passwordController;

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
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  bool isButtonPressed = false;
  String? passwordError;
  String? emailError;

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Invalid email format';
    }

    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
        .hasMatch(value)) {
      return 'Invalid Password format';
    }
    return null;
  }

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
              widget.title,
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
                  controller: widget.emailController,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    prefixIcon: widget.prefixIcon,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            if (widget.additionalHintText.isNotEmpty) ...[
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: widget.passwordController,
                    decoration: InputDecoration(
                      hintText: widget.additionalHintText,
                      prefixIcon: widget.additionalIcon,
                      border: InputBorder.none,
                    ),
                    obscureText: !widget.confirmPassword,
                  ),
                ),
              ),
            ],
            if (widget.thirdHintText.isNotEmpty) ...[
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
                      hintText: widget.thirdHintText,
                      prefixIcon: widget.thirdIcon,
                      border: InputBorder.none,
                    ),
                    obscureText: false, // Adjust this based on your needs
                  ),
                ),
              ),
            ],
            if (widget.confirmPassword) ...[
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
                    setState(() {
                      isButtonPressed = true;
                    });

                    String email = widget.emailController.text;
                    String password = widget.passwordController.text;

                    var emailError = validateEmail(email);
                    var passwordError = validatePassword(password);

                    if (widget.currentPageIndex == 1 &&
                        emailError == null &&
                        passwordError == null) {
                      SignupHelper.signup(context, email, password);
                    } else if (widget.currentPageIndex == 0 &&
                        emailError == null &&
                        passwordError == null) {
                      SigninHelper.signin(context, email, password);
                    } else {
                      if (emailError != null) {
                        Fluttertoast.showToast(
                          msg: emailError,
                          backgroundColor:
                              const Color.fromARGB(255, 62, 128, 208),
                        );
                      }
                      if (passwordError != null) {
                        Fluttertoast.showToast(
                          msg: passwordError,
                          backgroundColor:
                              const Color.fromARGB(255, 62, 128, 208),
                        );
                      }
                    }
                  },
                  child: Text(widget.title),
                ),
              ),
            ),
            if (widget.showGoogleSignIn) ...[
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
                if (widget.currentPageIndex == 0) {
                  widget.pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                } else if (widget.currentPageIndex == 1) {
                  widget.pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }
              },
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (widget.currentPageIndex == 0) {
                      widget.pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    } else if (widget.currentPageIndex == 1) {
                      widget.pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.currentPageIndex == 0
                              ? "Don't have an account? " // Add space after the question mark
                              : "Already have an account? ",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 139, 147, 155),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: widget.currentPageIndex == 0
                              ? "Sign Up"
                              : "Sign In",
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
