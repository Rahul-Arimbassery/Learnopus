import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:learnopus/View/errormessages/signin_out_error.dart';
import 'package:learnopus/model/profiledetails_viewmodel.dart';


Future<void> uploadingData(UserProfile userProfile) async {
  String imagePath = userProfile.imagePath;
  // Upload the image to Firebase Storage
  try {
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('user_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    final UploadTask uploadTask = storageReference.putFile(File(imagePath));

    final TaskSnapshot uploadSnapshot = await uploadTask.whenComplete(() {});

    final imageUrl = await uploadSnapshot.ref.getDownloadURL();

    // Store image path and user details in Firestore
    await FirebaseFirestore.instance.collection("users").add({
      'username': userProfile.username,
      'mobileNumber': userProfile.mobileNumber,
      'qualification': userProfile.qualification,
      'place': userProfile.place,
      'imagePath': imageUrl, // Store the generated image URL
    });
    showToast('Image uploaded to Storage and user details stored in Firestore');
  } catch (error) {
    showToast('Error uploading image and storing data: $error');
  }
}
