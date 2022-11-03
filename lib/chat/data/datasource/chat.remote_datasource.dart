// ignore_for_file: lines_longer_than_80_chars

import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/warp_raygun.dart';

class ChatData {
  ChatData(this._warp, this._warpStream);
  final WarpRaygun _warp;
  final WarpRaygunEventStream _warpStream;

  Stream<List<Map<String, dynamic>?>> watchAllConversations() {
    try {
      return _warpStream.watchAllConversations();
    } catch (error) {
      rethrow;
    }
  }

  void closeWatchAllConversations() => _warpStream.closeWatchAllConversations();

  String createConversation({
    required User user,
  }) {
    return _warp.createConversation(user.did!);
  }

  Stream<Map<String, dynamic>?> watchChatMessages({
    required String conversationID,
    required User user,
  }) =>
      _warpStream.watchChatMessages(
        conversationID,
        user.did!,
      );

  void closeWatchChatMessagesStream() =>
      _warpStream.closeWatchUserStatusStream();

  void sendMessage(ChatMessage newMessage) {
    return _warp.sendMessage(
      conversationID: newMessage.conversationId,
      newMessage: newMessage.message,
    );
  }

  List<ChatMessage> gettAllMessagesInConversation({
    required String conversationID,
    required User user,
  }) {
    try {
      final _chatMessagesList = <ChatMessage>[];
      final _messages = _warp.getAllMessagesFromConversation(
        conversationID,
      );
      for (final message in _messages) {
        final _chatMessage = ChatMessage.fromMap(message, user.did!);
        _chatMessagesList.add(_chatMessage);
      }

      return _chatMessagesList;
    } catch (error) {
      throw Exception(error);
    }
  }
}
