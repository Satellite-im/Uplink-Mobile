import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

abstract class IChatRepository {
  Stream<List<Map<String, dynamic>?>> watchAllConversations();

  void closeWatchAllConversations();

  Stream<Map<String, dynamic>?> watchChatMessages(
    String conversationID,
    User user,
  );

  String createConversation({
    required User user,
  });

  void closeWatchChatMessagesStream();

  void sendMessage({required ChatMessage newMessage});

  List<ChatMessage> getAllMessagesInConversation({
    required String conversationID,
    required User user,
  });
}
