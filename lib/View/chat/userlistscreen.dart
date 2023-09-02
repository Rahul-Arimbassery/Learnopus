// // import 'package:flutter/material.dart';
// // import 'package:learnopus/view/chat/chatID.dart';
// // import 'package:learnopus/view/chat/chatscreen.dart';

// // class UserListScreen extends StatelessWidget {
// //   final List<String> users; // List of user IDs

// //   UserListScreen({required this.users});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('User List'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: users.length,
// //         itemBuilder: (context, index) {
// //           final userId = users[index];
// //           return ListTile(
// //             title: Text('User $userId'),
// //             onTap: () {
// //               String chatRoomId = generateChatID(currentUserId, userId);
// //               Navigator.of(context).push(
// //                 MaterialPageRoute(
// //                   builder: (context) => ChatScreen(
// //                     chatRoomId: chatRoomId,
// //                     userId: userId,
// //                   ),
// //                 ),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:learnopus/view/chat/chatID.dart';
// import 'package:learnopus/view/chat/chatscreen.dart';

// class UserListScreen extends StatelessWidget {
//   final List<String> users; // List of user IDs

//   const UserListScreen({super.key, required this.users});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User List'),
//       ),
//       body: ListView.builder(
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           final userId = users[index];

//           final User? user = FirebaseAuth.instance.currentUser;

//           if (user != null) {
//             final currentUserId = user.uid;
//             final chatRoomId = generateChatID(currentUserId, userId);

//             return ListTile(
//               title: Text('User $userId'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => ChatScreen(
//                       chatRoomId: chatRoomId,
//                       userId: userId,
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             // Handle the case where no user is currently logged in
//             return ListTile(
//               title: Text('User $userId (Not Logged In)'),
//               onTap: () {
//                 // Handle what happens when a user is not logged in
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:learnopus/view/chat/chatID.dart';
// import 'package:learnopus/view/chat/chatscreen.dart';

// class UserListScreen extends StatefulWidget {
//   const UserListScreen({super.key});

//   @override
//   _UserListScreenState createState() => _UserListScreenState();
// }

// class _UserListScreenState extends State<UserListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Start Chat'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           final users = snapshot.data!.docs;

//           return ListView.separated(
//             itemCount: users.length,
//             separatorBuilder: (context, index) =>
//                 const SizedBox(), // Add a divider between items
//             itemBuilder: (context, index) {
//               final userData = users[index].data() as Map<String, dynamic>;
//               final userId = userData['username'] as String?;
//               final userImage = userData['imagePath'] as String?;

//               return Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     radius: 25,
//                     backgroundImage:
//                         userImage != null ? NetworkImage(userImage) : null,
//                   ),
//                   title: Text(
//                     userId ?? 'Unknown User',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   tileColor: const Color.fromARGB(
//                       255, 249, 249, 249), // Background color of the ListTile
//                   trailing: IconButton(
//                     icon: const Icon(Icons.chat), // Add the chat icon
//                     onPressed: () {
//                       final User? currentUser =
//                           FirebaseAuth.instance.currentUser;
//                       if (currentUser != null) {
//                         String currentUserId = currentUser.uid;
//                         // Now you can use currentUserId to generate the chat room ID
//                         String chatRoomId =
//                             generateChatID(currentUserId, userId!);

//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ChatScreen(
//                               chatRoomId: chatRoomId,
//                               userId: userId,
//                             ),
//                           ),
//                         );
//                       }
//                       // Handle tapping on the chat icon
//                       // You can navigate to a chat screen or perform any other chat-related action here
//                     },
//                   ),
//                   onTap: () {
//                     // Handle tapping on a user to initiate a chat or other actions
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:learnopus/view/chat/chatscreen.dart'; // Import Firebase Authentication

// class UserListScreen extends StatefulWidget {
//   const UserListScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _UserListScreenState createState() => _UserListScreenState();
// }

// class _UserListScreenState extends State<UserListScreen> {
//   String? currentUserId; // Declare a variable to store the current user's ID

//   @override
//   void initState() {
//     super.initState();

//     // Retrieve the current user's ID when the widget initializes
//     getCurrentUserId();
//   }

//   // Function to retrieve the current user's ID from Firebase Authentication
//   void getCurrentUserId() {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         currentUserId = user.uid;
//       });
//     } else {
//       // Handle the case where the user is not logged in
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Start Chat'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           final users = snapshot.data!.docs;

//           return ListView.separated(
//             itemCount: users.length,
//             separatorBuilder: (context, index) =>
//                 const SizedBox(), // Add a divider between items
//             itemBuilder: (context, index) {
//               final userData = users[index].data() as Map<String, dynamic>;
//               final userId = userData['username'] as String?;
//               final userImage = userData['imagePath'] as String?;

//               return Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     radius: 25,
//                     backgroundImage:
//                         userImage != null ? NetworkImage(userImage) : null,
//                   ),
//                   title: Text(
//                     userId ?? 'Unknown User',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   tileColor: const Color.fromARGB(
//                       255, 249, 249, 249), // Background color of the ListTile
//                   trailing: IconButton(
//                     icon: const Icon(Icons.chat), // Add the chat icon
//                     onPressed: () {
//                       // Check if the current user's ID is available
//                       if (currentUserId != null) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ChatScreen(
//                               currentUserId: currentUserId!,
//                               recipientUserId: userId ?? 'Unknown User',
//                             ),
//                           ),
//                         );
//                       } else {
//                         // Handle the case where the user is not logged in
//                         // You can navigate to the login screen or display a message
//                       }
//                     },
//                   ),
//                   onTap: () {
//                     // Handle tapping on a user to initiate a chat or other actions
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

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
