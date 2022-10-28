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

  factory ChatMessage.fromMap(Map<String, dynamic> message, String userDID) {
    try {
      final _reactionsMap = message['reactions'] as List<Map<String, dynamic>>;
      final _reactions = <Reactions>[];

      for (final element in _reactionsMap) {
        final _emoji = element['emoji'] as String;
        final _sendersDID = element['senders_did'] as List<String>;

        final _reaction = Reactions(_emoji, _sendersDID);
        _reactions.add(_reaction);
      }
      final _senderDID = message['sender'] as String;
      final _chatMessage = ChatMessage.receiveMessage(
        conversationId: message['conversation_id'] as String,
        messageId: message['message_id'] as String,
        message: message['value'] as String,
        messageSentTime: message['date_time'] as DateTime,
        chatMessageType: _senderDID.contains(userDID)
            ? ChatMessageType.received
            : ChatMessageType.sent,
        pinned: message['pinned'] as bool,
        replied: '',
        senderDID: _senderDID,
        reactions: _reactions,
      );
      return _chatMessage;
    } catch (error) {
      throw Exception(['chat_message_from_map', error]);
    }
  }

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
