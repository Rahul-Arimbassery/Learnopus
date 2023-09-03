import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnopus/view/chat/userlistscreen.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Text('User data not found');
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              userData['imagePath'] ?? 'assets/profile.png'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    userData['username'],
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      // Add follow/unfollow functionality here
                                    },
                                    icon: const Icon(
                                      Icons.person_add,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(width: 1),
                                  IconButton(
                                    onPressed: () {
                                      // Navigate to chat screen
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UserListScreen(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.chat,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Posts',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('100'), // Replace with actual post count
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Followers',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('500'), // Replace with actual follower count
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Following',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('300'), // Replace with actual following count
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Container(
                          color: const Color.fromARGB(255, 247, 245, 245),
                          child: const TabBar(
                            labelColor: Colors.blue,
                            unselectedLabelColor:
                                Color.fromARGB(255, 146, 144, 144),
                            tabs: [
                              Tab(text: 'Feed'),
                              Tab(text: 'About'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 400,
                          child: TabBarView(
                            children: [
                              _buildTab1Content(user.uid),
                              // Content for Tab 2
                              const Center(child: Text('Tab 2 Content')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text('No user is currently logged in'),
      );
    }
  }

  Widget _buildTab1Content(String userId) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .where('userId', isEqualTo: userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text('No posts found');
        }

        // Display the posts in a ListView
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final post =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
            final postImage = post['imagePath'] as String?;
            final postText = post['text'] as String?;

            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      if (postImage != null)
                        Image.network(
                          postImage,
                          width: double.infinity,
                          height: 200, // Adjust the height as needed
                          fit: BoxFit.cover,
                        ),
                      if (postText != null)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(postText),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
