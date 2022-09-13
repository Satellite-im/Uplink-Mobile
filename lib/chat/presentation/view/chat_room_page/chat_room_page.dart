// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/core/utils/date_format.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/chat/presentation/controller/chat_bloc.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

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
  final _chatController = GetIt.I.get<ChatBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _chatController.add(CreateConversationStarted(widget.user));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _chatController.dispose();
    super.dispose();
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
              BlocBuilder<ChatBloc, ChatState>(
                bloc: _chatController,
                builder: (context, state) {
                  if (state is ChatLoadSucces || state is ChatLoadInProgress) {
                    return Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return _chatController.chatMessagesList[index];
                        },
                        itemCount: _chatController.chatMessagesList.length,
                      ),
                    );
                  } else {
                    return const Expanded(child: SizedBox.shrink());
                  }
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: UChatbar(
                  textEditingController: _textEditingController,
                  onMsg: (value) async {
                    _chatController.add(SendNewMessageStarted(value));
                  },
                  onImage: () {},
                  onSticker: () async {},
                  onEmoji: () async {},
                  onGif: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
