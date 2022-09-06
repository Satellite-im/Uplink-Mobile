import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/core/utils/date_format.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/domain/message.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/warp_raygun.dart';

part 'models/u_chat_message.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final _textEditingController = TextEditingController();
  final _currentUserController = GetIt.I.get<UpdateCurrentUserBloc>();
  final _scrollController = ScrollController();
  final _warpRaygun = WarpRaygun();
  String? _lastMessageReceived;

  final List<UChatMessage> _messageList = [];

  void _addValue(String value) {
    setState(() {
      var _hideProfilePicture = false;

      if (_messageList.isNotEmpty &&
          _messageList.first.key.toString().contains('message_received')) {
        _hideProfilePicture = true;
        final _lastMessage = _messageList.first;
        _messageList
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
              user: widget.user,
            ),
          );
      }
      _messageList.insert(
        0,
        UChatMessage(
          key: Key('message_received_${DateTime.now()}'),
          chatMessage: ChatMessage(
            message: value,
            messageSentTime: DateTime.now(),
            chatMessageType: ChatMessageType.received,
          ),
          hideProfilePicture: _hideProfilePicture,
          currentUser: _currentUserController.currentUser!,
          user: widget.user,
        ),
      );
      _scrollController.jumpTo(0);
    });
  }

  void _sendMessage(String value) {
    setState(() {
      var _hideProfilePicture = false;
      _warpRaygun.sendMessage(value);
      if (_messageList.isNotEmpty &&
          _messageList.first.key.toString().contains('message_sent')) {
        _hideProfilePicture = true;
        final _lastMessage = _messageList.first;
        _messageList
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
              user: widget.user,
            ),
          );
      }
      _messageList.insert(
        0,
        UChatMessage(
          key: Key('message_sent_${DateTime.now()}'),
          currentUser: _currentUserController.currentUser!,
          user: widget.user,
          hideProfilePicture: _hideProfilePicture,
          chatMessage: ChatMessage(
            message: value,
            messageSentTime: DateTime.now(),
            chatMessageType: ChatMessageType.sent,
          ),
        ),
      );
      _scrollController.jumpTo(0);
    });
  }

  @override
  void initState() {
    _warpRaygun.createConversation(widget.user.did!);
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      final message = _warpRaygun.receiveMessage().last;
      if (_lastMessageReceived != message) {
        _lastMessageReceived = message;
        _addValue(message);
      }
    });
    setState(() {
      final _warpChatMessages = _warpRaygun.getAllMessagesForOneConversation(
        _currentUserController.currentUser!,
        widget.user,
      );
      for (final element in _warpChatMessages) {
        _messageList.add(element);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        title: widget.user.username,
        actionList: [
          IconButton(
            icon: const UIcon(
              UIcons.voice_call,
              color: UColors.textMed,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const UIcon(
              UIcons.video_call,
              color: UColors.textMed,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: UUserProfileWithStatus(
                userProfileSize: UUserProfileSize.topMenuBar,
                uImage: UImage(
                  imagePath: widget.user.profilePicture?.path,
                  fit: BoxFit.cover,
                  imageSource: ImageSource.file,
                ),
                status: Status.online,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return _messageList[index];
                  },
                  itemCount: _messageList.length,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: UChatbar(
                  textEditingController: _textEditingController,
                  onMsg: (value) {
                    _sendMessage(value.trim());
                  },
                  onImage: () {
                    _addValue('image');
                  },
                  onSticker: () {
                    _warpRaygun.createConversation(widget.user.did!);
                    _addValue('sticker');
                  },
                  onEmoji: () {},
                  onGif: () {
                    _addValue('gif');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
