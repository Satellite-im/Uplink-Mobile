enum ChatMessageType { sent, received }

class ChatMessage {
  ChatMessage({
    required this.conversationId,
    this.messageId,
    required this.message,
    required this.messageSentTime,
    required this.chatMessageType,
  });

  final String conversationId;
  final String? messageId;
  final String message;
  final DateTime messageSentTime;
  final ChatMessageType chatMessageType;
}
