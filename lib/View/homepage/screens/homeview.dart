// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Color.fromARGB(255, 62, 128, 208),
//       body: Center(
//         child: Text(
//           'Home Page',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 248, 249),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Text('No posts found');
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final post =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                final userId = post['userId'] as String?;
                final text = post['text'] as String?;
                final imagePath = post['imagePath'] as String?;
                return FutureBuilder<DocumentSnapshot?>(
                  future: getUserProfile(userId ?? ''),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Container(); // Return an empty container while loading
                    }
                    if (userSnapshot.hasError) {
                      return Text('Error: ${userSnapshot.error}');
                    }
                    final userData =
                        userSnapshot.data?.data() as Map<String, dynamic>?;
                    return Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(userData?['imagePath'] ?? ''),
                            ),
                            title: Text(userData?['username'] ?? ''),
                          ),
                          if (imagePath != null)
                            Image.network(
                              imagePath,
                              width: double.infinity,
                              height: 200, // Adjust the height as needed
                              fit: BoxFit.cover,
                            ),
                          if (text != null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(text),
                            ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<DocumentSnapshot?> getUserProfile(String userId) async {
    final DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userSnapshot.exists) {
      return userSnapshot;
    } else {
      return null;
    }
  }
}
