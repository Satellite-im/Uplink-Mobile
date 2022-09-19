// ignore_for_file: lines_longer_than_80_chars

import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/warp_raygun.dart';

class ChatData {
  ChatData(this._warp);
  final WarpRaygun _warp;

  String createConversation({
    required User user,
  }) {
    return _warp.createConversation(user.did!);
  }

  void sendMessage(ChatMessage newMessage) {
    return _warp.sendMessage(
      conversationID: newMessage.conversationId,
      newMessage: newMessage.message,
    );
  }

  ChatMessage? getLastMessageReceived({
    required String conversationID,
    required User user,
  }) {
    try {
      final _mapMessage = _warp.getLastMessageReceived(
        conversationID: conversationID,
        userDID: user.did!,
      );
      if (_mapMessage != null) {
        final _chatMessage = _transformMapInChatMessage(_mapMessage, user);
        return _chatMessage;
      }
      return null;
    } catch (error) {
      throw Exception(['get_last_message_received', error]);
    }
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
        final _chatMessage = _transformMapInChatMessage(message, user);
        _chatMessagesList.add(_chatMessage);
      }

      return _chatMessagesList;
    } catch (error) {
      throw Exception(error);
    }
  }

  ChatMessage _transformMapInChatMessage(
    Map<String, dynamic> message,
    User user,
  ) {
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
        chatMessageType: _senderDID.contains(user.did!)
            ? ChatMessageType.received
            : ChatMessageType.sent,
        pinned: message['pinned'] as bool,
        replied: '',
        senderDID: _senderDID,
        reactions: _reactions,
      );
      return _chatMessage;
    } catch (error) {
      throw Exception(['transform_map_in_chat_message', error]);
    }
  }
}
