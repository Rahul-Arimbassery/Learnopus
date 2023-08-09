import 'package:flutter/material.dart';

class AuthContainerModel {
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

  AuthContainerModel({
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
}
