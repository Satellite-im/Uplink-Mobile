import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/presentation/controller/chat_bloc.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

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
  final _friendController = GetIt.I.get<FriendBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _chatController.add(CreateConversationStarted(widget.user));
    _friendController.add(WatchUserStarted(userDid: widget.user.did!));
    _chatController.add(GetNewMessageFromUserStarted());
    _friendController.user = widget.user;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _chatController
      ..dispose()
      ..closeWatchChatMessagesStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<FriendBloc, FriendState>(
          bloc: _friendController,
          builder: (context, state) {
            User user;
            if (state is FriendLoadSuccess) {
              user = state.user!;
            } else {
              user = _friendController.user!;
            }
            return UAppBar.actions(
              title: user.username,
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
                        imagePath: user.profilePicture?.path,
                        imageSource: ImageSource.file,
                      ),
                      status: user.status!,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
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
                  onImage: () {
                    // TODO(Chat): add onImage function
                  },
                  onSticker: () {
                    // TODO(Chat): add onSticker function
                  },
                  onEmoji: () {
                    // TODO(Chat): add onEmoji function
                  },
                  onGif: () {
                    // TODO(Chat): add onGif function
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
