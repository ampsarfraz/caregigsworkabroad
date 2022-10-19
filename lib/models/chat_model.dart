class ChatModel {
  final String chatId;
  final String username;
  final String profilePicUrl;
  final int lastRecievedMessage;
  ChatModel(
      {required this.chatId,
      required this.username,
      required this.lastRecievedMessage,
      required this.profilePicUrl});
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['name'],
      username: json['date'],
      lastRecievedMessage: json['order_total_price'],
      profilePicUrl: json['order_total_quantity'],
    );
  }
}
