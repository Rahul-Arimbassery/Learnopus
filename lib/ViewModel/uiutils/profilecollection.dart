import 'package:flutter/material.dart';
import 'package:learnopus/Model/firestore/writedata_model.dart';
import 'package:learnopus/ViewModel/uimodels/profiledetails_viewmodel.dart';

void submitDetails(BuildContext context, textController1, textController2,
    textController3, textController4, selectedImagePath) {
  UserProfile userProfile = UserProfile(
    username: textController1.text,
    email: textController2.text,
    mobileNumber: textController3.text,
    place: textController4.text,
    imagePath: selectedImagePath,
  );
  //uploadingData(userProfile);
}
