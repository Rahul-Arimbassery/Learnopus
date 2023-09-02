// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatScreen extends StatefulWidget {
//   final String userId; // Pass the userId of the user you want to chat with
//   ChatScreen({required this.userId});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Firestore collection reference for messages
//   late CollectionReference _messagesCollection;

//   @override
//   void initState() {
//     super.initState();
    
//     // Define the Firestore collection for this chat room
//     _messagesCollection = _firestore.collection('chats').doc('chatId').collection('messages');
//   }

//   // Function to send a message to Firestore
//   void _sendMessage() async {
//     final messageText = _messageController.text.trim();

//     if (messageText.isNotEmpty) {
//       await _messagesCollection.add({
//         'text': messageText,
//         'timestamp': FieldValue.serverTimestamp(), // Store the message timestamp
//         'senderId': 'currentUserId', // Replace with the sender's user ID
//       });

//       // Clear the text input field after sending the message
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.userId}'),
//       ),
//       body: Column(
//         children: [
//           // Display chat messages
//           StreamBuilder<QuerySnapshot>(
//             stream: _messagesCollection.orderBy('timestamp').snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               }

//               if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               }

//               final messages = snapshot.data!.docs;

//               return Expanded(
//                 child: ListView.builder(
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final messageData = messages[index].data() as Map<String, dynamic>;
//                     final messageText = messageData['text'] as String;

//                     // Display the message
//                     return ListTile(
//                       title: Text(messageText),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),

//           // Text input field for sending messages
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  final String currentUserId; // Current user's ID
  final String recipientUserId; // Recipient's ID

  ChatScreen({required this.currentUserId, required this.recipientUserId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final chatRoomId =
        '${widget.currentUserId}_${widget.recipientUserId}';
    
    final CollectionReference messagesCollection =
        _firestore.collection('chats').doc(chatRoomId).collection('messages');

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.recipientUserId}'),
      ),
      body: Column(
        children: [
          // Display chat messages
          StreamBuilder<QuerySnapshot>(
            stream: messagesCollection
                .orderBy('timestamp')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              final messages = snapshot.data!.docs;

              return Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final messageData =
                        messages[index].data() as Map<String, dynamic>;
                    final messageText = messageData['text'] as String;

                    // Display the message
                    return ListTile(
                      title: Text(messageText),
                    );
                  },
                ),
              );
            },
          ),

          // Text input field for sending messages
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final messageText = _messageController.text.trim();

                    if (messageText.isNotEmpty) {
                      messagesCollection.add({
                        'text': messageText,
                        'timestamp': FieldValue.serverTimestamp(),
                        'senderId': widget.currentUserId,
                      });

                      // Clear the text input field after sending the message
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
