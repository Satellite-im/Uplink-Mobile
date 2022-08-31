import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

part 'models/chatbar_items.dart';
part 'models/send_message_button.dart';
part 'models/add_expand_button.dart';
part 'models/chatbar_textfield.dart';

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
  int numberOfLines = 1;
  double _containerSize = 56;

  final _duration = const Duration(
    milliseconds: 200,
  );

  @override
  void initState() {
    super.initState();

    widget.textEditingController.addListener(() {
      setState(() {
        _changeSendMessageState();
        _calculateContainerSize();
      });
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

  void _onTextSubmitted() {
    if (widget.textEditingController.text.trim().isNotEmpty) {
      widget.onMsg(widget.textEditingController.text);
    }
    _changeSendMessageState(sendMessageState: false);
    _containerSize = 56;
    _calculateContainerSize();
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

  void _calculateContainerSize() {
    final textSpan = TextSpan(
      text: widget.textEditingController.text,
      style: UTextStyle.B1_body.style.returnTextStyleType(
        color: Colors.white,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 12,
      textDirection: TextDirection.ltr,
    );
    final _screenSize = MediaQuery.of(context).size;
    const _textFieldWidthFactor = 173;
    const _textFieldWidthFactorWithItems = 94;
    final _textFieldWidth = _screenSize.width -
        _textFieldWidthFactor -
        (_isSendMessageState ? 0 : _textFieldWidthFactorWithItems);

    textPainter.layout(maxWidth: _textFieldWidth);
    final numberOfLinesBefore = numberOfLines - 1;
    numberOfLines = textPainter.computeLineMetrics().length;

    if (numberOfLines <= (_screenSize.width > 360 ? 12 : 10)) {
      if (((numberOfLines - numberOfLinesBefore == 2) ||
              (numberOfLines == numberOfLinesBefore) ||
              (numberOfLines - numberOfLinesBefore < 0)) &&
          numberOfLines != 0) {
        _containerSize = 40 + (numberOfLines * 16);
      } else if (widget.textEditingController.text.isEmpty) {
        _containerSize = 56;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      height: _containerSize,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _AddExpandButton(
            duration: _duration,
            isSendMessageState: _isSendMessageState,
            expandButtonOnTap: () {
              _changeSendMessageState(sendMessageState: false);
              _calculateContainerSize();
            },
            addButtonOnTap: () {
              widget.onImage();
            },
          ),
          AnimatedContainer(
            duration: _duration,
            width: !_isSendMessageState ? 16 : 0,
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    (numberOfLines > 1 && _containerSize > 56) ? 16 : 50),
                color: UColors.foregroundDark,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _ChatBarTextField(
                    numberOfLines: numberOfLines,
                    isSendMessageState: _isSendMessageState,
                    onChanged: (value) {
                      _changeSendMessageState(
                          sendMessageState: value.isNotEmpty ? true : false);
                    },
                    onSubmitted: () {
                      _onTextSubmitted();
                    },
                    controller: widget.textEditingController,
                    focusNode: _focusNode,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: widget.onEmoji,
                        child: const UIcon(
                          UIcons.chatbar_emojis,
                          color: UColors.textDark,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox.square(
                    dimension: 17,
                  ),
                  _UChatBarItems(
                    isSendMessageState: _isSendMessageState,
                    onTap: widget.onSticker,
                    icon: UIcons.chatbar_stickers,
                    duration: _duration,
                  ),
                  _UChatBarItems(
                    isSendMessageState: _isSendMessageState,
                    onTap: widget.onGif,
                    icon: UIcons.chatbar_gifs,
                    duration: _duration,
                  ),
                ],
              ),
            ),
          ),
          _SendMessageButton(
            duration: _duration,
            isTextEmpty: widget.textEditingController.text.isEmpty,
            onTextSubmitted: () {
              _onTextSubmitted();
            },
          ),
        ],
      ),
    );
  }
}
