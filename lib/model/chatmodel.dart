class ChatMessage {
  final String senderId;
  final String recipientId; // Add this property
  final String text;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.recipientId, // Initialize it in the constructor
    required this.text,
    required this.timestamp,
  });
}
