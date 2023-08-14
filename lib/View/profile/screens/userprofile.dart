import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 62, 128, 208),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .snapshots(), // Use your collection name
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Display a loading indicator
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // Data has been fetched
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: documents.length,
              itemBuilder: (BuildContext context, int index) {
                final data = documents[index].data() as Map<String, dynamic>;
                return Card(
                  color: const Color.fromARGB(255, 62, 128, 208),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  data['imagePath'] ?? 'default_image_url'),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              data['username'] ?? 'No Title',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          data['mobileNumber'] ?? 'No Description',
                          style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 208, 206, 206),),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data['qualification'] ?? 'No Additional Text',
                          style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 208, 206, 206),),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data['place'] ?? 'No Additional Text',
                          style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 208, 206, 206),),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
