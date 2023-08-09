import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnopus/ViewModel/uimodels/profiledetails_viewmodel.dart';

Future<void> uploadingData(UserProfile userProfile) async {
  await FirebaseFirestore.instance.collection("products").add({
    'username': userProfile.username,
    'email': userProfile.email,
    'mobileNumber': userProfile.mobileNumber,
    'place': userProfile.place,
    'imagePath': userProfile.imagePath,
  });
}
