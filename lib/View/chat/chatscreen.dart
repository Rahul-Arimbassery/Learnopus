import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnopus/model/chatmodel.dart';

class ChatScreen extends StatefulWidget {
  final String currentUserId;
  final String recipientUserId;

  const ChatScreen({super.key, required this.currentUserId, required this.recipientUserId});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  void sendMessage(String messageText) {
    if (messageText.isNotEmpty) {
      messagesCollection.add({
        'senderId': widget.currentUserId,
        'recipientId': widget.recipientUserId,
        'text': messageText,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipientUserId),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messagesCollection
                  .orderBy('timestamp')
                  .snapshots(), // Query messages by timestamp
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final messages = snapshot.data!.docs;
                List<ChatMessage> chatMessages = [];

                for (var message in messages) {
                  final messageData = message.data() as Map<String, dynamic>;
                  final senderId = messageData['senderId'];
                  final recipientId = messageData['recipientId'];
                  final text = messageData['text'];
                  final timestamp = messageData['timestamp'];

                  if (senderId != null &&
                      recipientId != null &&
                      text != null &&
                      timestamp != null) {
                    final timestampDate = timestamp.toDate();
                    final chatMessage = ChatMessage(
                      senderId: senderId,
                      recipientId: recipientId,
                      text: text,
                      timestamp: timestampDate,
                    );
                    chatMessages.add(chatMessage);
                  }
                }

                return ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    final message = chatMessages[index];
                    final isCurrentUser =
                        message.senderId == widget.currentUserId;
                    final isRecievdUser =
                        message.recipientId == widget.currentUserId;

                    // Check if the message is from the current user to the recipient
                    if (isCurrentUser &&
                            message.recipientId == widget.recipientUserId ||
                        isRecievdUser &&
                            message.senderId == widget.recipientUserId) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              message.text,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    // Check if the message is from the recipient to the current user
                    if (!isCurrentUser &&
                            message.senderId == widget.recipientUserId ||
                        !isRecievdUser &&
                            message.recipientId == widget.recipientUserId) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              message.text,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    // Return an empty container for messages that don't match the current chat
                    return Container();
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    String messageText = _messageController.text.trim();
                    sendMessage(messageText);
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
