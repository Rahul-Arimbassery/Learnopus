import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnopus/ViewModel/uimodels/profiledetails_viewmodel.dart';

Future<void> uploadingData(UserProfile userProfile) async {
  await FirebaseFirestore.instance.collection("users").add({
    'username': userProfile.username,
    'mobileNumber': userProfile.mobileNumber,
    'qualification': userProfile.qualification,
    'place': userProfile.place,
    'imagePath': userProfile.imagePath,
  });
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:learnopus/ViewModel/uimodels/profiledetails_viewmodel.dart';

// Future<void> uploadingData(UserProfile userProfile, File imageFile) async {
//   // Step 1: Upload the image to Firebase Storage
//   try {
//     final Reference storageReference = FirebaseStorage.instance
//         .ref()
//         .child('user_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

//     final UploadTask uploadTask = storageReference.putFile(imageFile);

//     final TaskSnapshot uploadSnapshot = await uploadTask.whenComplete(() {});
    
//     final imageUrl = await uploadSnapshot.ref.getDownloadURL();
    
//     // Step 2: Store image path and user details in Firestore
//     await FirebaseFirestore.instance.collection("users").add({
//       'username': userProfile.username,
//       'mobileNumber': userProfile.mobileNumber,
//       'qualification': userProfile.qualification,
//       'place': userProfile.place,
//       'imagePath': imageUrl, // Store the generated image URL
//     });

//     print('Image uploaded to Storage and user details stored in Firestore');
//   } catch (error) {
//     print('Error uploading image and storing data: $error');
//   }
// }
