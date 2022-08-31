import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final _textEditingController = TextEditingController();

  final List<String> _textList = [];

  void _addValue(String value) {
    setState(() {
      _textList.add(value);
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: UUserProfileWithStatus(
                userProfileSize: UUserProfileSize.topMenuBar,
                uImage: UImage(
                  imagePath: '',
                  // _controller.currentUser?.profilePicture?.path,
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
                  itemBuilder: (context, index) {
                    return Text(_textList[index]);
                  },
                  itemCount: _textList.length,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: UChatbar(
                  textEditingController: _textEditingController,
                  onMsg: (value) {
                    _addValue(value);
                  },
                  onImage: () {
                    _addValue('image');
                  },
                  onSticker: () {
                    _addValue('sticker');
                  },
                  onEmoji: () {
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
