import 'package:flutter/material.dart';
import 'package:learnopus/ViewModel/uimodels/auth_viewmodel.dart';
import 'package:learnopus/model/firebase/googlesignin_model.dart';
import 'package:learnopus/View/otppage/utils/navigation_utils.dart';
import 'package:learnopus/View/otppage/utils/signin_out_utils.dart';


class AuthContainer extends StatelessWidget {
  final AuthContainerModel model;

  const AuthContainer({super.key, required this.model});

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
              model.title,
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
                  controller: model.emailController,
                  decoration: InputDecoration(
                    hintText: model.hintText,
                    prefixIcon: model.prefixIcon,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            if (model.additionalHintText.isNotEmpty) ...[
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: model.passwordController,
                    decoration: InputDecoration(
                      hintText: model.additionalHintText,
                      prefixIcon: model.additionalIcon,
                      border: InputBorder.none,
                    ),
                    obscureText: !model.confirmPassword,
                  ),
                ),
              ),
            ],
            if (model.thirdHintText.isNotEmpty) ...[
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
                      hintText: model.thirdHintText,
                      prefixIcon: model.thirdIcon,
                      border: InputBorder.none,
                    ),
                    obscureText: false, // Adjust this based on your needs
                  ),
                ),
              ),
            ],
            if (model.confirmPassword) ...[
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
                    String email = model.emailController.text;
                    String password = model.passwordController.text;
                    AuthLogic.handleAuthButtonPressed(
                      context: context,
                      currentPageIndex: model.currentPageIndex,
                      email: email,
                      password: password,
                    );
                  },
                  child: Text(model.title),
                ),
              ),
            ),
            //if (model.showGoogleSignIn) ...[
            const SizedBox(height: 20), // Add spacing
            Center(
              child: TextButton(
                onPressed: () {
                  signinWithGoogle(context: context);
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
            //],

            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                NavigationUtils.navigateToNextPage(
                    model.pageController, model.currentPageIndex);
              },
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    NavigationUtils.navigateToNextPage(
                        model.pageController, model.currentPageIndex);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: model.currentPageIndex == 0
                              ? "Don't have an account? " // Add space after the question mark
                              : "Already have an account? ",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 139, 147, 155),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: model.currentPageIndex == 0
                              ? "Create Account"
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
