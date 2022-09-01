import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/core/utils/date_format.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/domain/message.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/warp_raygun.dart';

part 'models/message_received.dart';
part 'models/message_sent.dart';

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
  final _warpRaygun = WarpRaygun();

  @override
  void initState() {
    _warpRaygun
      ..enableRayGun()
      ..createConversation(widget.user.did!);

    // final _receivedMessagesList = _warpRaygun.receiveMessage();

    // for (final element in _receivedMessagesList) {
    //   _receivedMessageList.add(
    //     MessageReceived(
    //       messageReceived: Message(
    //         message: element,
    //         messageSentTime: DateTime.now(),
    //       ),
    //       showCompleteMessage: false,
    //       // hideProfilePicture: false,
    //       user: widget.user,
    //     ),
    //   );
    // }
    super.initState();
  }

  final List<MessageReceived> _receivedMessageList = [];

  void _addValue(String value) {
    setState(() {
      // bool _hideProfilePicture = false;
      if (_receivedMessageList.isNotEmpty &&
          _receivedMessageList.last.key
              .toString()
              .contains('message_received')) {
        // _hideProfilePicture = true;
        final _lastMessage = _receivedMessageList.last.messageReceived;
        _receivedMessageList
          ..removeLast()
          ..add(
            MessageReceived(
              key: Key('message_received_${_lastMessage.messageSentTime}'),
              messageReceived: _lastMessage,
              showCompleteMessage: false,
              // hideProfilePicture: false,
              user: widget.user,
            ),
          );
      }
      _receivedMessageList.add(
        MessageReceived(
          key: Key('message_received_${DateTime.now()}'),
          messageReceived: Message(
            message: value,
            messageSentTime: DateTime.now(),
          ),
          // hideProfilePicture: false,
          user: widget.user,
        ),
      );
    });
  }

  void _sendMessage(String value) {
    setState(() {
      _warpRaygun.sendMessage(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        title: 'username',
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
                child: StreamBuilder<Object>(
                    stream: null,
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return _receivedMessageList[index];
                        },
                        itemCount: _receivedMessageList.length,
                      );
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: UChatbar(
                  textEditingController: _textEditingController,
                  onMsg: _sendMessage,
                  onImage: () {
                    _addValue('image');
                  },
                  onSticker: () {
                    _addValue('sticker');
                  },
                  onEmoji: () {
                    _warpRaygun.receiveMessage();
                    _addValue('emoji');
                  },
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
