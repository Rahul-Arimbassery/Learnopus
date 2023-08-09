import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnopus/View/profile/utils/profileimage_utils.dart';
import 'package:learnopus/ViewModel/provider/imagemodel_provider.dart';
import 'package:learnopus/ViewModel/uiutils/profilecollection.dart';
import 'package:learnopus/view/navigationpage/screen/navigation_view.dart';
import 'package:provider/provider.dart';

class ProfileEnterScreen extends StatelessWidget {
  const ProfileEnterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textController1 = TextEditingController();
    TextEditingController textController2 = TextEditingController();
    TextEditingController textController3 = TextEditingController();
    TextEditingController textController4 = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Create Your Profile to Start',
              style: GoogleFonts.b612(
                color: const Color.fromARGB(255, 246, 244, 244),
                textStyle: const TextStyle(fontSize: 18),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 62, 128, 208),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Consumer<ImageProviderModel>(
                    builder: (context, imageProvider, child) {
                       selectedImagePath = imageProvider.selectedImagePath;

                      return GestureDetector(
                        onTap: () {
                          selectImage(context); // Pass the context
                        },
                        child: Container(
                          width: 100, // Set your desired width
                          height: 100, // Set your desired height
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.transparent), // No border
                          ),
                          child: ClipOval(
                            child: selectedImagePath.isNotEmpty
                                ? Image.file(
                                    File(selectedImagePath),
                                    fit: BoxFit.cover, // Maintain aspect ratio
                                  )
                                : Image.asset(
                                    'assets/profile.png',
                                    scale: 7,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                _buildTextField(
                  textController1,
                  'Enter Your Username',
                  Icons.person,
                ),
                const SizedBox(height: 20.0),
                _buildTextField(
                  textController2,
                  'Enter Mobile Number',
                  Icons.cabin,
                ),
                const SizedBox(height: 20.0),
                _buildTextField(
                  textController3,
                  'Previous Education/Qualifications',
                  Icons.school,
                ),
                const SizedBox(height: 20.0),
                _buildTextField(
                  textController4,
                  'Enter Your Place',
                  Icons.tab,
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 92, 121, 169),
                      foregroundColor: const Color.fromARGB(255, 59, 255, 118),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (_validateFields(
                        textController1,
                        textController2,
                        textController3,
                        textController4,
                      )) {
                        Fluttertoast.showToast(
                          msg: 'Submitting...',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor:
                              const Color.fromARGB(255, 124, 30, 39),
                        );

                        submitDetails(
                            context,
                            textController1,
                            textController2,
                            textController3,
                            textController4,
                            selectedImagePath); // Perform submission logic here ..Adding data to firestore.

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigationPage(),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Please fill all fields',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor:
                              const Color.fromARGB(255, 124, 30, 39),
                        );
                      }
                    },
                    child: Text(
                      'Submit Details',
                      style: GoogleFonts.b612(
                        color: const Color.fromARGB(255, 250, 249, 249),
                        textStyle: const TextStyle(fontSize: 16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, IconData prefixIcon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color.fromARGB(255, 229, 225, 225),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          prefixIcon: Icon(prefixIcon),
          labelStyle: const TextStyle(color: Colors.black26),
        ),
        // onChanged: (newValue) {
        //   controller.text = newValue; // when changing values update controller
        // },
      ),
    );
  }

  bool _validateFields(
    TextEditingController controller1,
    TextEditingController controller2,
    TextEditingController controller3,
    TextEditingController controller4,
  ) {
    return controller1.text.isNotEmpty &&
        controller2.text.isNotEmpty &&
        controller3.text.isNotEmpty &&
        controller4.text.isNotEmpty;
  }
}
