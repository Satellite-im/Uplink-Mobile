import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

abstract class IChatRepository {
  String createConversation({
    required User user,
  });

  void sendMessage({required ChatMessage newMessage});

  ChatMessage? getLastMessageReceived({
    required String conversationID,
    required User user,
  });

  List<ChatMessage> getAllMessagesInConversation({
    required String conversationID,
    required User user,
  });
}
