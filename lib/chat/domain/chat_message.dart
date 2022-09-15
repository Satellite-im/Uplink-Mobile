enum ChatMessageType { sent, received }

class ChatMessage {
  ChatMessage.receiveMessage({
    required this.conversationId,
    required this.messageId,
    required this.message,
    required this.messageSentTime,
    required this.chatMessageType,
    required this.pinned,
    required this.reactions,
    required this.replied,
    required this.senderDID,
  });

  const ChatMessage.sendMessage({
    required this.conversationId,
    required this.message,
    required this.messageSentTime,
    required this.chatMessageType,
  })  : senderDID = null,
        replied = null,
        pinned = null,
        reactions = null,
        messageId = null;

  final String conversationId;
  final String? messageId;
  final String? senderDID;
  final String message;
  final String? replied;
  final DateTime messageSentTime;
  final ChatMessageType chatMessageType;
  final bool? pinned;
  final List<Reactions>? reactions;
}

class Reactions {
  Reactions(
    this.emoji,
    this.sendersDID,
  );

  final String emoji;
  final List<String> sendersDID;
}
