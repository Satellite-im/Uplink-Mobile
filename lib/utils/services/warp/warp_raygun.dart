// ignore_for_file: lines_longer_than_80_chars

import 'package:get_it/get_it.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:warp_dart/warp.dart';

class WarpRaygun {
  final _warp = GetIt.I.get<WarpBloc>();

  String? lastMessageIDReceived;

  String? conversationID;

  String createConversation(String userDID) {
    try {
      final _currentUserConversations = _warp.raygun!.listConversation();
      for (final conversation in _currentUserConversations) {
        if (conversation.recipients[0].toString().contains(userDID) ||
            conversation.recipients[1].toString().contains(userDID)) {
          return conversation.id;
        }
      }

      final conversation = _warp.raygun!.createConversation('did:key:$userDID');
      return conversation.id;
    } catch (error) {
      throw Exception(['create_conversation_exception', error]);
    }
  }

  List<Map<String, dynamic>> getAllMessagesFromConversation(
    String conversationID,
  ) {
    try {
      final _messagesMap = <Map<String, dynamic>>[];
      final _raygunMessages = _warp.raygun!.getMessages(conversationID);

      for (final message in _raygunMessages) {
        final _reactions = <Map<String, dynamic>>[];
        if (message.reactions.isNotEmpty) {
          for (final reaction in message.reactions) {
            final _reactionMap = {
              'emoji': reaction.emoji,
              'senders_did': reaction.sender
                  .map((e) => e.toString().replaceAll('did:key:', '')),
            };
            _reactions.add(_reactionMap);
          }
        }

        final _message = {
          'message_id': message.id,
          'date_time': message.date.toLocal(),
          'pinned': message.pinned,
          'reactions': _reactions,
          'conversation_id': message.conversationId,
          'metadata': message.metadata,
          'replied': message.replied,
          'sender': message.sender.toString().replaceAll('did:key:', ''),
          'value': message.value.first,
        };

        _messagesMap.add(_message);
      }
      return _messagesMap;
    } on WarpException catch (error) {
      if (error.error_message == 'Message is empty') {
        return <Map<String, dynamic>>[];
      }
      throw Exception(['get_all_messages_from_conversation', error]);
    } catch (error) {
      throw Exception(['get_all_messages_from_conversation', error]);
    }
  }

  void sendMessage({
    required String conversationID,
    required String newMessage,
  }) {
    try {
      _warp.raygun!.send(conversationID, [newMessage.trim()]);
    } catch (error) {
      throw Exception(['send_message_exception', error]);
    }
  }

  Map<String, dynamic>? getLastMessageReceived({
    required String conversationID,
    required String userDID,
  }) {
    try {
      final _raygunMessages = _warp.raygun!.getMessages(conversationID);

      final _lastRaygunMessage = _raygunMessages.last;
      if (_lastRaygunMessage.sender.toString().contains(userDID)) {
        final _reactions = <Map<String, dynamic>>[];
        if (_lastRaygunMessage.reactions.isNotEmpty) {
          for (final reaction in _lastRaygunMessage.reactions) {
            final _reactionMap = {
              'emoji': reaction.emoji,
              'senders_did': reaction.sender
                  .map((e) => e.toString().replaceAll('did:key:', '')),
            };
            _reactions.add(_reactionMap);
          }
        }
        final _message = {
          'message_id': _lastRaygunMessage.id,
          'date_time': _lastRaygunMessage.date.toLocal(),
          'pinned': _lastRaygunMessage.pinned,
          'reactions': _reactions,
          'metadata': _lastRaygunMessage.metadata,
          'conversation_id': _lastRaygunMessage.conversationId,
          'replied': _lastRaygunMessage.replied,
          'sender':
              _lastRaygunMessage.sender.toString().replaceAll('did:key:', ''),
          'value': _lastRaygunMessage.value.first,
        };
        return _message;
      }

      return null;
    } on WarpException catch (error) {
      if (error.error_message == 'Message is empty') {
        return null;
      }
      throw Exception(['get_last_message_received', error]);
    } catch (error) {
      throw Exception(['get_last_message_received', error]);
    }
  }
}
