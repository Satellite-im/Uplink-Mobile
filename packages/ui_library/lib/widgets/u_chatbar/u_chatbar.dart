import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

/// Create a UChatbar widget
///
/// [onMsg]'s input is the String from user's typing
///
/// For example
/// ```dart
/// UChatbar(
///  textEditingController: _textEditingController,
///   onMsg: (value) {
///     _addValue(value);
///   },
///   onImage: () {
///     _addValue('image');
///   },
///   onSticker: () {
///     _addValue('sticker');
///   },
///  onEmoji: () {
///    _addValue('emoji');
///  },
///  onGif: () {
///    _addValue('gif');
///  },
/// ),
/// ...
/// final _textEditingController = TextEditingController();
/// void _addValue(String value) {
///    setState(() {
///      _textList.add(value);
///    });
///  }
/// ```
class UChatbar extends StatefulWidget {
  const UChatbar({
    Key? key,
    required this.textEditingController,
    required this.onImage,
    required this.onSticker,
    required this.onEmoji,
    required this.onGif,
    required this.onMsg,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final VoidCallback onImage;
  final VoidCallback onSticker;
  final VoidCallback onEmoji;
  final VoidCallback onGif;
  final ValueChanged<String> onMsg;

  @override
  State<UChatbar> createState() => _UChatbarState();
}

class _UChatbarState extends State<UChatbar> {
  final _focusNode = FocusNode();
  bool _isSendMessageState = false;

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(() {
      setState(() {});
    });
    _focusNode
        .addListener(() => FocusScope.of(context).requestFocus(_focusNode));
  }

  @override
  void dispose() {
    super.dispose();
    widget.textEditingController.dispose();
    _focusNode.dispose();
  }

  void _onTextSubmitted(String value) {
    if (value.trim().isNotEmpty) widget.onMsg(value);
    _changeSendMessageState(sendMessageState: false);
    widget.textEditingController.clear();
    _focusNode.unfocus();
  }

  void _changeSendMessageState({bool sendMessageState = true}) {
    setState(() {
      _isSendMessageState =
          (widget.textEditingController.text.isNotEmpty && sendMessageState)
              ? true
              : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 150,
            ),
            transitionBuilder: (child, animation) => RotationTransition(
              turns: child.key == const ValueKey('add_button')
                  ? Tween<double>(begin: 1, end: 0.75).animate(animation)
                  : Tween<double>(begin: 0.75, end: 1).animate(animation),
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            ),
            child: !_isSendMessageState
                ? UIconButton.add(
                    onPressed: widget.onImage,
                  )
                : InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () =>
                        _changeSendMessageState(sendMessageState: false),
                    child: const UIcon(
                      UIcons.right_arrow_inline_button,
                      color: UColors.ctaBlue,
                    ),
                  ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 7, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: UColors.foregroundDark,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.newline,
                      controller: widget.textEditingController,
                      focusNode: _focusNode,
                      cursorColor: UColors.textDark,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ULibraryStrings.uChatBarHintText,
                        hintStyle: UTextStyle.H5_fifthHeader.style
                            .returnTextStyleType(),
                      ),
                      onChanged: (value) {
                        _changeSendMessageState(
                            sendMessageState: value.isNotEmpty ? true : false);
                      },
                      onSubmitted: (value) {
                        _onTextSubmitted(value);
                      },
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(
                      milliseconds: 150,
                    ),
                    opacity: _isSendMessageState ? 0 : 1,
                    child: InkWell(
                      onTap: _isSendMessageState ? null : widget.onSticker,
                      child: const UIcon(
                        UIcons.chatbar_stickers,
                        color: UColors.textDark,
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  AnimatedOpacity(
                    duration: const Duration(
                      milliseconds: 150,
                    ),
                    opacity: _isSendMessageState ? 0 : 1,
                    child: InkWell(
                      onTap: _isSendMessageState ? null : widget.onGif,
                      child: const UIcon(
                        UIcons.chatbar_gifs,
                        color: UColors.textDark,
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  InkWell(
                    onTap: widget.onEmoji,
                    child: const UIcon(
                      UIcons.chatbar_emojis,
                      color: UColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(
              milliseconds: 150,
            ),
            width: widget.textEditingController.text.isEmpty ? 0 : 41,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(width: 17),
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    _onTextSubmitted(widget.textEditingController.text);
                  },
                  child: const UIcon(
                    UIcons.chatbar_send_button,
                    color: UColors.ctaBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
