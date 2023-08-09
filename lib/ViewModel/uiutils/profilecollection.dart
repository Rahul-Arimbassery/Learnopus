import 'package:flutter/material.dart';
import 'package:learnopus/Model/firestore/writedata_model.dart';
import 'package:learnopus/ViewModel/uimodels/profiledetails_viewmodel.dart';

submitDetails(BuildContext context, textController1, textController2,
    textController3, textController4, selectedImagePath) {
  UserProfile userProfile = UserProfile(
    username: textController1.text,
    mobileNumber: textController2.text,
    qualification: textController3.text,
    place: textController4.text,
    imagePath: selectedImagePath,
  );
  uploadingData(userProfile);
}
