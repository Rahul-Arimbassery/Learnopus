// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:learnopus/View/errormessages/signin_out_error.dart';
// import 'package:learnopus/model/postmodel.dart';


// Future<void> uploadPost(Post post) async {
//   String imagePath = post.imagePath;

//   try {
//     final Reference storageReference = FirebaseStorage.instance
//         .ref()
//         .child('post_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

//     final UploadTask uploadTask = storageReference.putFile(File(imagePath));
//     final uploadSnapshot = await uploadTask;
//     final imageUrl = await uploadSnapshot.ref.getDownloadURL();
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser != null) {
//       final postReference =
//           FirebaseFirestore.instance.collection("posts").doc();

//       // Set the data for the specific document using doc().set()
//       await postReference.set({
//         'userId': currentUser.uid,
//         'text': post.text,
//         'imagePath': imageUrl,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       showToast('Post uploaded successfully');
//     } else {
//       showToast('No user is currently logged in');
//     }
//   } catch (error) {
//     showToast('Error uploading post: $error');
//   }
// }


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:learnopus/model/postmodel.dart';
import 'package:learnopus/view/navigationpage/screen/navigation_view.dart';
 // Import the page you want to navigate to

Future<void> uploadPost(BuildContext context, Post post) async {
  String imagePath = post.imagePath;

  // Show a "Uploading..." message
  const snackBar = SnackBar(content: Text('Uploading post...'));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  try {
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('post_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    final UploadTask uploadTask = storageReference.putFile(File(imagePath));
    final uploadSnapshot = await uploadTask;
    final imageUrl = await uploadSnapshot.ref.getDownloadURL();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      final postReference =
          FirebaseFirestore.instance.collection("posts").doc();

      // Set the data for the specific document using doc().set()
      await postReference.set({
        'userId': currentUser.uid,
        'text': post.text,
        'imagePath': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Show a "Post uploaded successfully" message
      const successSnackBar = SnackBar(content: Text('Post uploaded successfully'));
      ScaffoldMessenger.of(context).showSnackBar(successSnackBar);

      // Navigate to another page after a successful upload
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NavigationPage()), // Replace YourNextPage with the page you want to navigate to
      );
    } else {
      // Show a "No user logged in" message
      final errorSnackBar = SnackBar(content: Text('No user is currently logged in'));
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  } catch (error) {
    // Show an error message
    final errorSnackBar = SnackBar(content: Text('Error uploading post: $error'));
    ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
  }
}
