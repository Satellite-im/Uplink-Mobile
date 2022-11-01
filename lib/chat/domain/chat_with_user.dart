import 'package:uplink/shared/domain/entities/user.entity.dart';

class ChatWithUser {
  ChatWithUser({
    required this.conversationId,
    required this.messageId,
    required this.message,
    required this.messageSentTime,
    required this.userInChat,
  });

  static Future<ChatWithUser> fromMap(
    Map<String, dynamic> messageWithUser,
  ) async {
    return ChatWithUser(
      conversationId: messageWithUser['conversation_id'] as String,
      messageId: messageWithUser['message_id'] as String,
      message: messageWithUser['value'] as String,
      messageSentTime: messageWithUser['date_time'] as DateTime,
      userInChat:
          await User.fromMap(messageWithUser['user'] as Map<String, dynamic>),
    );
  }

  final String conversationId;
  final String? messageId;
  final String message;
  final DateTime messageSentTime;
  final User userInChat;
}
