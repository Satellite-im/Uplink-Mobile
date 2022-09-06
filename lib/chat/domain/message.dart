enum ChatMessageType { sent, received }

class ChatMessage {
  ChatMessage({
    required this.message,
    required this.messageSentTime,
    required this.chatMessageType,
  });

  final String message;
  final DateTime messageSentTime;
  final ChatMessageType chatMessageType;
}
