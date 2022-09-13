import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/chat/presentation/view/chat_room_page/chat_room_page.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:warp_dart/warp.dart';

class WarpRaygun {
  final _warp = GetIt.I.get<WarpBloc>();

  String? lastMessageIDReceived;

  String? conversationID;

  String? _userDID;

  String createConversation(String userDID) {
    try {
      conversationID = null;
      _userDID = null;
      lastMessageIDReceived = null;

      _userDID = userDID;
      final _currentUserConversations = _warp.raygun!.listConversation();
      for (final conversation in _currentUserConversations) {
        if (conversation.recipients[0].toString().contains(_userDID!) ||
            conversation.recipients[1].toString().contains(_userDID!)) {
          conversationID = conversation.id;
        }
      }

      if (conversationID == null) {
        final conversation =
            _warp.raygun!.createConversation('did:key:$userDID');
        conversationID = conversation.id;
      }
      return conversationID!;
    } catch (error) {
      throw Exception(['create_conversation_exception', error]);
    }
  }

  void sendMessage(String newMessage) {
    try {
      _warp.raygun!.send(conversationID!, [newMessage.trim()]);
    } catch (error) {
      throw Exception(['send_message_exception', error]);
    }
  }

  List<String> getLastMessageReceived() {
    try {
      final _messages = <String>[];
      final _raygunMessages = _warp.raygun!.getMessages(conversationID!);

      final _lastRaygunMessage = _raygunMessages.last;
      if (_lastRaygunMessage.sender.toString().contains(_userDID!)) {
        _messages
          ..add(_lastRaygunMessage.value.first)
          ..add(_lastRaygunMessage.id);
      }
      return _messages;
    } on WarpException catch (error) {
      if (error.error_message == 'Message is empty') {
        return [];
      }
      throw Exception(['get_last_message_received', error]);
    }
  }

  List<UChatMessage> getAllMessagesForOneConversation(
    CurrentUser currentUser,
    User user,
  ) {
    try {
      final list = <UChatMessage>[];
      final _raygunMessages = _warp.raygun!.getMessages(conversationID!);

      if (_raygunMessages.isEmpty) {
        return [];
      }

      for (var i = 0; i < _raygunMessages.length; i++) {
        var _hideProfilePicture = true;
        var _showCompleteMessage = true;
        var _chatMessageType = ChatMessageType.received;

        final _currentWarpMessage = _raygunMessages[i];

        if (_currentWarpMessage.sender.toString() ==
            'did:key:${currentUser.did}') {
          _chatMessageType = ChatMessageType.sent;
        }
        if (i != 0 &&
                _currentWarpMessage.sender.toString() !=
                    _raygunMessages[i - 1].sender.toString() ||
            i == 0) {
          _hideProfilePicture = false;
        }

        if (i != _raygunMessages.length - 1 &&
            _currentWarpMessage.sender.toString() ==
                _raygunMessages[i + 1].sender.toString()) {
          _showCompleteMessage = false;
        }
        final _messageDateTime = DateTime.fromMillisecondsSinceEpoch(
          _currentWarpMessage.date.millisecondsSinceEpoch,
        );
        list.add(
          UChatMessage(
            key: _chatMessageType == ChatMessageType.sent
                ? Key('message_sent_$_messageDateTime')
                : Key('message_received_$_messageDateTime'),
            currentUser: currentUser,
            showCompleteMessage: _showCompleteMessage,
            user: user,
            hideProfilePicture: _hideProfilePicture,
            chatMessage: ChatMessage(
              conversationId: _currentWarpMessage.conversationId,
              messageId: _currentWarpMessage.id,
              message: _currentWarpMessage.value.first,
              messageSentTime: _messageDateTime,
              chatMessageType: _chatMessageType,
            ),
          ),
        );
      }
      _getTheLastMessageReceived(list);
      return list.reversed.toList();
    } on WarpException catch (warpError) {
      if (warpError.error_message == 'Message is empty') {
        return [];
      }
      throw Exception(['get_all_messages_exception', warpError]);
    } catch (error) {
      throw Exception(['get_all_messages_exception', error]);
    }
  }

  void _getTheLastMessageReceived(List<UChatMessage> list) {
    try {
      final _lastUChatMessageReceived = list.lastWhere(
        (element) =>
            element.chatMessage.chatMessageType == ChatMessageType.received,
      );

      lastMessageIDReceived = _lastUChatMessageReceived.chatMessage.messageId;
    } catch (error) {
      if (error is StateError && error.message == 'No element') {
        lastMessageIDReceived = null;
      } else {
        throw Exception(['get_last_message_received_exception', error]);
      }
    }
  }
}
