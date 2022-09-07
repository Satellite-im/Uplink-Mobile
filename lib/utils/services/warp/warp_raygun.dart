import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/chat/presentation/view/chat_room_page/chat_room_page.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';

String? conversationID;

String? _userDID;

class WarpRaygun {
  final _warp = GetIt.I.get<WarpBloc>();

  void createConversation(String userDID) {
    try {
      _userDID = userDID;
      final _currentUserConversations = _warp.raygun!.listConversation();
      if (_currentUserConversations.isEmpty) {
        final conversation =
            _warp.raygun!.createConversation('did:key:$userDID');
        conversationID = conversation.id;
      } else {
        conversationID = _currentUserConversations.first.id;
      }
    } catch (error) {
      throw Exception(['create_conversation_exception', error]);
    }
  }

  void sendMessage(String newMessage) {
    try {
      final _listMessages = <String>[newMessage.trim()];
      _warp.raygun!.send(conversationID!, _listMessages);
    } catch (error) {
      throw Exception(['send_message_exception', error]);
    }
  }

  List<String> receiveMessage() {
    try {
      final _messages = <String>[];
      final _raygunMessages = _warp.raygun!.getMessages(conversationID!);

      if (_raygunMessages.isEmpty) {
        return [];
      }

      for (final warpMessage in _raygunMessages) {
        if (warpMessage.sender.toString() == 'did:key:$_userDID') {
          for (final message in warpMessage.value) {
            _messages.add(message);
          }
        }
      }
      return _messages;
    } catch (error) {
      throw Exception(['receive_message_exception', error]);
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
      return list.reversed.toList();
    } catch (error) {
      throw Exception(['get_all_messages_exception', error]);
    }
  }
}
