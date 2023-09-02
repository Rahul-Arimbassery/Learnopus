// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class PostPage extends StatefulWidget {
//   const PostPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _PostPageState createState() => _PostPageState();
// }

// class _PostPageState extends State<PostPage> {
//   File? _image;
//   final picker = ImagePicker();
//   final TextEditingController _textEditingController = TextEditingController();

//   Future<void> getImage(ImageSource source) async {
//     final pickedFile =
//         await picker.pickImage(source: source); // Corrected method

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (_image != null)
//                 SizedBox(
//                   height: 250, // Set the fixed height for the image container
//                   width: double.infinity,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: FileImage(_image!),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               const SizedBox(height: 10), // Display selected image
//               TextFormField(
//                 controller: _textEditingController,
//                 decoration: InputDecoration(
//                   hintText: 'What do you want to talk about?',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   contentPadding: const EdgeInsets.all(16.0),
//                 ),
//                 maxLines: 4,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                     onPressed: () => getImage(ImageSource.gallery),
//                     icon: const Icon(
//                       Icons.photo_library,
//                       size: 40, // Adjust the size of the icon
//                       color: Colors.blue, // Change the icon color
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () => getImage(ImageSource.camera),
//                     icon: const Icon(
//                       Icons.camera_alt,
//                       size: 40,
//                       color: Colors.green,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.send,
//                       size: 40,
//                       color: Colors.orange,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnopus/model/postmodel.dart';
import 'package:learnopus/viewmodel/database/uploadpost.dart';
import 'package:learnopus/viewmodel/provider/postpage_provider.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostState(),
      child: _PostPageContent(),
    );
  }
}

class _PostPageContent extends StatelessWidget {
  Future<void> pickImage(ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      Provider.of<PostState>(context, listen: false)
          .setImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PostState>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.image != null)
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(state.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (text) => state.setText(text),
                decoration: InputDecoration(
                  hintText: 'What do you want to talk about?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.all(16.0),
                ),
                maxLines: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => pickImage(ImageSource.gallery, context),
                    icon: const Icon(
                      Icons.photo_library,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () => pickImage(ImageSource.camera, context),
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      // Implement the logic to submit the post using state.text and state.image
                      Post post = Post(text: state.text, imagePath: state.image!.path);
                      await uploadPost(context,post);
                    },
                    icon: const Icon(
                      Icons.send,
                      size: 40,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
