import 'package:flutter/material.dart';
import 'package:learnopus/View/errormessages/signin_out_error.dart';
import 'package:learnopus/View/otppage/utils/validation_utils.dart';
import 'package:learnopus/viewmodel/database/emailsignin.dart';
import 'package:learnopus/viewmodel/database/emailsignup.dart';

class AuthLogic {
  static void handleAuthButtonPressed({
    required BuildContext context,
    required int currentPageIndex,
    required String email,
    required String password,
  }) {
    var emailError = ValidationUtils.validateEmail(email);
    var passwordError = ValidationUtils.validatePassword(password);

    if (currentPageIndex == 1 && emailError == null && passwordError == null) {
      SignupHelper.signup(context, email, password);
    } else if (currentPageIndex == 0 &&
        emailError == null &&
        passwordError == null) {
      SigninHelper.signin(context, email, password);
    } else {
      if (emailError != null || passwordError != null) {
        String errorMessage =
            emailError ?? passwordError ?? "An error occurred";
        ToastUtils.showErrorMessage(errorMessage);
      }
    }
  }
}
