String generateChatID(String userID1, String userID2) {
  // Ensure user IDs are in a consistent order to avoid duplicates
  List<String> participants = [userID1, userID2];
  participants.sort();

  // Concatenate user IDs with a separator
  String chatID = participants.join('_');

  // Optionally, you can add a timestamp or a random string for uniqueness
  chatID += '_' + DateTime.now().millisecondsSinceEpoch.toString();

  return chatID;
}
