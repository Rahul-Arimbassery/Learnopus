import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learnopus/view/chat/chatscreen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String?
      currentUserName; // Declare a variable to store the current user's name
  String? currentUserId;

  @override
  void initState() {
    super.initState();

    // Retrieve the current user's name when the widget initializes
    getCurrentUserName();
  }

  // Function to retrieve the current user's name from Firebase Authentication
  void getCurrentUserName() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserName = user.email;
        currentUserId = user.uid;
      });
    } else {
      // Handle the case where the user is not logged in
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Chat'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final users = snapshot.data!.docs;

          return ListView.separated(
            itemCount: users.length,
            separatorBuilder: (context, index) =>
                const SizedBox(), // Add a divider between items
            itemBuilder: (context, index) {
              final userData = users[index].data() as Map<String, dynamic>;
              final userName = userData['username'] as String?;
              final userImage = userData['imagePath'] as String?;

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        userImage != null ? NetworkImage(userImage) : null,
                  ),
                  title: Text(
                    userName ?? 'Unknown User',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  tileColor: const Color.fromARGB(
                      255, 249, 249, 249), // Background color of the ListTile
                  trailing: IconButton(
                    icon: const Icon(Icons.chat), // Add the chat icon
                    onPressed: () {
                      // Check if the current user's name is available
                      if (currentUserName != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              currentUserId: currentUserId!,
                              recipientUserId: userName ?? 'Unknown User',
                            ),
                          ),
                        );
                      } else {
                        // Handle the case where the user is not logged in
                        // You can navigate to the login screen or display a message
                      }
                    },
                  ),
                  onTap: () {
                    // Handle tapping on a user to initiate a chat or other actions
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
