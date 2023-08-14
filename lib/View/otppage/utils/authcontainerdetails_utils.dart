import 'package:flutter/material.dart';
import 'package:learnopus/model/auth_viewmodel.dart';

import '../../../ViewModel/provider/otppagemodel_provider.dart';
import '../screens/auth_conatiner.dart';

AuthContainer authContainerSecond(OtpPageModel otpPageModel, pageController,
    emailController, passwordController) {
  return AuthContainer(
    model: AuthContainerModel(
      title: "Create Account",
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
        Icons.person,
        size: 20,
      ),
      showGoogleSignIn: false,
      confirmPassword: false,
      currentPageIndex: otpPageModel.currentPageIndex,
      pageController: pageController,
      emailController: emailController,
      passwordController: passwordController,
    ),
  );
}

AuthContainer authContainerFirst(OtpPageModel otpPageModel, pageController,
    emailController, passwordController) {
  return AuthContainer(
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
      currentPageIndex: otpPageModel.currentPageIndex,
      pageController: pageController,
      emailController: emailController,
      passwordController: passwordController,
    ),
  );
}
