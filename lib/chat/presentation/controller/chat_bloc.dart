import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/chat/presentation/view/chat_room_page/chat_room_page.dart';
import 'package:uplink/profile/presentation/controller/current_user_bloc.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/services/warp/warp_raygun.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<SendNewMessageStarted>((event, emit) {
      try {
        emit(ChatLoadInProgress(chatMessagesList));
        _warp.raygun!.send(conversationID!, [event.newMessageSent]);
        _prepareNewMessageSentToUI(event);
        emit(ChatLoadSucces(chatMessagesList));
      } catch (error) {
        addError(error);
        emit(ChatLoadError());
      }
    });

    on<CreateConversationStarted>((event, emit) {
      try {
        user = event.user;
        conversationID = _warpRaygun.createConversation(user!.did!);
        chatMessagesList = _warpRaygun.getAllMessagesForOneConversation(
          _currentUserController.currentUser!,
          user!,
        );
        add(GetNewMessageFromUserStarted());
      } catch (error) {
        addError(error);
        emit(ChatLoadError());
      }
    });

    on<GetNewMessageFromUserStarted>(
      (event, emit) {
        _callGetNewMessage =
            Timer.periodic(const Duration(milliseconds: 300), (timer) {
          final _lastMessageReceived = _warpRaygun.getLastMessageReceived();

          if (_lastMessageReceived.isNotEmpty &&
              _lastMessageReceivedID != _lastMessageReceived.last) {
            _lastMessageReceivedID = _lastMessageReceived.last;
            _prepareLastMessageReceivedToUI(_lastMessageReceived.first);
            emit(ChatLoadSucces(chatMessagesList));
          }
        });
      },
    );
  }

  void dispose() {
    _callGetNewMessage!.cancel();
    chatMessagesList.clear();
    conversationID = null;
    user = null;
  }

  void _prepareNewMessageSentToUI(SendNewMessageStarted event) {
    var _hideProfilePicture = false;
    if (chatMessagesList.isNotEmpty &&
        chatMessagesList.first.key.toString().contains('message_sent')) {
      _hideProfilePicture = true;
      final _lastMessage = chatMessagesList.first;
      chatMessagesList
        ..removeAt(0)
        ..insert(
          0,
          UChatMessage(
            key: Key(
              'message_sent_${_lastMessage.chatMessage.messageSentTime}',
            ),
            chatMessage: _lastMessage.chatMessage,
            showCompleteMessage: false,
            hideProfilePicture: _lastMessage.hideProfilePicture,
            currentUser: _currentUserController.currentUser!,
            user: user!,
          ),
        );
    }
    chatMessagesList.insert(
      0,
      UChatMessage(
        key: Key('message_sent_${DateTime.now()}'),
        currentUser: _currentUserController.currentUser!,
        user: user!,
        hideProfilePicture: _hideProfilePicture,
        chatMessage: ChatMessage(
          conversationId: conversationID!,
          message: event.newMessageSent,
          messageSentTime: DateTime.now(),
          chatMessageType: ChatMessageType.sent,
        ),
      ),
    );
  }

  void _prepareLastMessageReceivedToUI(String value) {
    var _hideProfilePicture = false;

    if (chatMessagesList.isNotEmpty &&
        chatMessagesList.first.key.toString().contains('message_received')) {
      _hideProfilePicture = true;
      final _lastMessage = chatMessagesList.first;
      chatMessagesList
        ..removeAt(0)
        ..insert(
          0,
          UChatMessage(
            key: Key(
              'message_received_${_lastMessage.chatMessage.messageSentTime}',
            ),
            chatMessage: _lastMessage.chatMessage,
            showCompleteMessage: false,
            hideProfilePicture: _lastMessage.hideProfilePicture,
            currentUser: _currentUserController.currentUser!,
            user: user!,
          ),
        );
    }

    chatMessagesList.insert(
      0,
      UChatMessage(
        key: Key('message_received_${DateTime.now()}'),
        chatMessage: ChatMessage(
          conversationId: conversationID!,
          message: value,
          messageSentTime: DateTime.now(),
          chatMessageType: ChatMessageType.received,
        ),
        hideProfilePicture: _hideProfilePicture,
        currentUser: _currentUserController.currentUser!,
        user: user!,
      ),
    );
  }

  List<UChatMessage> chatMessagesList = [];

  Timer? _callGetNewMessage;

  final _warp = GetIt.I.get<WarpBloc>();
  final _currentUserController = GetIt.I.get<CurrentUserBloc>();
  final _warpRaygun = WarpRaygun();

  User? user;

  String? conversationID;

  String _lastMessageReceivedID = '';
}
