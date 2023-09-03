import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatInputWidget extends StatefulWidget {
  final String senderUserId;
  final String receiverUserId;

  const ChatInputWidget(
      {super.key, required this.senderUserId, required this.receiverUserId});

  @override
  // ignore: library_private_types_in_public_api
  _ChatInputWidgetState createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  String conversationId = '';
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Generate the unique conversation ID
    generateConversationId();
  }

  // Function to generate a unique conversation ID
  void generateConversationId() {
    List<String> userIds = [widget.senderUserId, widget.receiverUserId];
    userIds.sort(); // Sort the user IDs to ensure consistency
    conversationId = userIds.join('_'); // Create a unique conversation ID
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .add({
        'text': text,
        'sender': widget.senderUserId,
        'receiver': widget.receiverUserId,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildMessages(),
        ),
        _buildMessageInput(),
      ],
    );
  }

  Widget _buildMessages() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .orderBy('timestamp')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final messages = snapshot.data!.docs;

        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final messageData = messages[index].data() as Map<String, dynamic>;
            final messageText = messageData['text'] as String;
            final messageSender = messageData['sender'] as String;

            // Determine if the message is sent by the current user
            final isCurrentUser = messageSender == widget.senderUserId;

            return ListTile(
              title: Text(messageText),
              // Style the message differently based on sender
              tileColor: isCurrentUser ? Colors.blue : Colors.grey,
              // Align the message to the right if sent by the current user
              trailing: isCurrentUser ? null : const Icon(Icons.person),
            );
          },
        );
      },
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
