import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uplink/chat/data/repositories/chat.repository.dart';
import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/chat/domain/chat_with_user.dart';
import 'package:uplink/chat/presentation/view/chat_room_page/models/u_chat_message.dart';
import 'package:uplink/profile/presentation/controller/current_user_bloc.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this._repository) : super(ChatInitial()) {
    on<WatchAllConversations>(
      (event, emit) async {
        try {
          emit(ChatLoadInProgress(const []));
          final _allChatsWithUser = <ChatWithUser>[];

          await emit.onEach(
            _watchAllConversations(),
            onData: (_allConversationsMap) async {
              if (_allConversationsMap.isNotEmpty) {
                _allChatsWithUser.clear();
                for (final conversationMap in _allConversationsMap) {
                  final _chatWithUser =
                      await ChatWithUser.fromMap(conversationMap!);
                  _allChatsWithUser.add(_chatWithUser);
                }

                emit(AllChatsLoadSuccess(_allChatsWithUser));
              }
            },
            onError: (error, stackTrace) {
              addError(error);
              emit(ChatLoadError());
            },
          );
        } catch (error) {
          addError(error);
          emit(ChatLoadError());
        }
      },
      transformer: restartable(),
    );

    on<SendNewMessageStarted>((event, emit) {
      try {
        emit(ChatLoadInProgress(chatMessagesList));
        final _chatMessageToSent = ChatMessage.sendMessage(
          conversationId: _conversationID!,
          message: event.newMessageSent,
          messageSentTime: DateTime.now(),
          chatMessageType: ChatMessageType.sent,
        );
        _repository.sendMessage(newMessage: _chatMessageToSent);
        _prepareNewMessageSentToUI(_chatMessageToSent);
        emit(ChatLoadSucces(chatMessagesList));
      } catch (error) {
        addError(error);
        emit(ChatLoadError());
      }
    });

    on<CreateConversationStarted>((event, emit) {
      try {
        chatMessagesList.clear();
        emit(ChatLoadInProgress(chatMessagesList));
        _user = event.user;
        _conversationID = _repository.createConversation(user: _user!);
        final _allMessagesInConversation =
            _repository.getAllMessagesInConversation(
          conversationID: _conversationID!,
          user: _user!,
        );
        chatMessagesList = _prepareAllMessagesForUI(_allMessagesInConversation);
        emit(ChatLoadSucces(chatMessagesList));
      } catch (error) {
        addError(error);
        emit(ChatLoadError());
      }
    });

    on<GetNewMessageFromUserStarted>(
      (event, emit) async {
        try {
          closeWatchAllConversations();
          await emit.onEach(
            _watchChatMessages(),
            onData: (newMessageMap) {
              if (newMessageMap != null) {
                final _newChatMessage =
                    ChatMessage.fromMap(newMessageMap, _user!.did!);
                _prepareLastMessageReceivedToUI(_newChatMessage);
                emit(
                  ChatLoadSucces(
                    chatMessagesList.removeMessagesDuplicated(),
                  ),
                );
              }
            },
            onError: (error, stackTrace) {
              addError(error);
              emit(ChatLoadError());
            },
          );
        } catch (error) {
          addError(error);
          emit(ChatLoadError());
        }
      },
      transformer: restartable(),
    );
  }

  List<UChatMessage> chatMessagesList = [];

  Stream<List<Map<String, dynamic>?>> _watchAllConversations() =>
      _repository.watchAllConversations();

  Stream<Map<String, dynamic>?> _watchChatMessages() =>
      _repository.watchChatMessages(
        _conversationID!,
        _user!,
      );

  void closeWatchChatMessagesStream() =>
      _repository.closeWatchChatMessagesStream();

  void closeWatchAllConversations() => _repository.closeWatchAllConversations();

  final _currentUserController = GetIt.I.get<CurrentUserBloc>();
  final IChatRepository _repository;

  User? _user;

  String? _conversationID;

  List<UChatMessage> _prepareAllMessagesForUI(
    List<ChatMessage> allMessages,
  ) {
    try {
      final list = <UChatMessage>[];

      if (allMessages.isEmpty) {
        return [];
      }

      for (var i = 0; i < allMessages.length; i++) {
        var _hideProfilePicture = true;
        var _showCompleteMessage = true;
        var _chatMessageType = ChatMessageType.received;

        final _currentWarpMessage = allMessages[i];

        if (_currentWarpMessage.senderDID ==
            _currentUserController.currentUser!.did!) {
          _chatMessageType = ChatMessageType.sent;
        }
        if (i != 0 &&
                _currentWarpMessage.senderDID != allMessages[i - 1].senderDID ||
            i == 0) {
          _hideProfilePicture = false;
        }

        if (i != allMessages.length - 1 &&
            _currentWarpMessage.senderDID == allMessages[i + 1].senderDID) {
          _showCompleteMessage = false;
        }
        final _messageDateTime = DateTime.fromMillisecondsSinceEpoch(
          _currentWarpMessage.messageSentTime.millisecondsSinceEpoch,
        );
        list.add(
          UChatMessage(
            key: _chatMessageType == ChatMessageType.sent
                ? Key('message_sent_$_messageDateTime')
                : Key('message_received_$_messageDateTime'),
            currentUser: _currentUserController.currentUser!,
            showCompleteMessage: _showCompleteMessage,
            user: _user!,
            hideProfilePicture: _hideProfilePicture,
            chatMessage: _currentWarpMessage,
          ),
        );
      }
      if (list.isNotEmpty &&
          list.any(
            (element) =>
                element.chatMessage.chatMessageType == ChatMessageType.received,
          )) {
        list.lastWhere(
          (element) {
            if (element.chatMessage.chatMessageType ==
                ChatMessageType.received) {
              return true;
            }
            return false;
          },
        );
      }

      return list.reversed.toList();
    } catch (error) {
      throw Exception(['get_all_messages_exception', error]);
    }
  }

  void dispose() {
    chatMessagesList.clear();
  }

  void _prepareNewMessageSentToUI(ChatMessage chatMessage) {
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
            user: _user!,
          ),
        );
    }
    chatMessagesList.insert(
      0,
      UChatMessage(
        key: Key('message_sent_${chatMessage.messageSentTime}'),
        currentUser: _currentUserController.currentUser!,
        user: _user!,
        hideProfilePicture: _hideProfilePicture,
        chatMessage: chatMessage,
      ),
    );
  }

  void _prepareLastMessageReceivedToUI(ChatMessage chatMessage) {
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
            user: _user!,
          ),
        );
    }

    chatMessagesList.insert(
      0,
      UChatMessage(
        key: Key('message_received_${chatMessage.messageSentTime}'),
        chatMessage: chatMessage,
        hideProfilePicture: _hideProfilePicture,
        currentUser: _currentUserController.currentUser!,
        user: _user!,
      ),
    );
  }
}

extension RemoveDuplicate on List<UChatMessage> {
  List<UChatMessage> removeMessagesDuplicated() {
    final _messageIDsSet = <String>{};
    return where(
      (chatMessage) => _messageIDsSet.add(chatMessage.chatMessage.messageId!),
    ).toList();
  }
}
