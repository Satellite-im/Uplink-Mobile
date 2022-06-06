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

  void _onTextSubmitted(String value) {
    if (value.trim().isNotEmpty) widget.onMsg(value);
    _changeSendMessageState(sendMessageState: false);
    _containerSize = 56;
    _calculateContainerSize();
    widget.textEditingController.clear();
    _focusNode.unfocus();
  }

  void _changeSendMessageState({bool sendMessageState = true}) => setState(() {
        _isSendMessageState =
            (widget.textEditingController.text.isNotEmpty && sendMessageState)
                ? true
                : false;
      });

  void _calculateContainerSize() {
    final textSpan = TextSpan(
      text: widget.textEditingController.text,
      style: UTextStyle.H5_fifthHeader.style
          .returnTextStyleType(color: Colors.white),
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 12,
      textDirection: TextDirection.ltr,
    );
    final _screenSize = MediaQuery.of(context).size;
    const _textFieldWidthFactor = 173;
    const _textFieldWidthFactorWithItems = 95;
    final _textFieldWidth = _screenSize.width -
        _textFieldWidthFactor -
        (_isSendMessageState ? 0 : _textFieldWidthFactorWithItems);

    textPainter.layout(maxWidth: _textFieldWidth);
    final numberOfLinesBefore = numberOfLines - 1;
    numberOfLines = textPainter.computeLineMetrics().length;

    if (numberOfLines <= 12) {
      if (numberOfLines - numberOfLinesBefore == 2) {
        _containerSize += 16;
      } else if (numberOfLines == numberOfLinesBefore) {
        _containerSize -= 16;
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
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedPadding(
              duration: _duration,
              padding: _isSendMessageState
                  ? const EdgeInsets.only(bottom: 8)
                  : const EdgeInsets.only(bottom: 0),
              child: AnimatedSwitcher(
                duration: _duration,
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
                        onTap: () {
                          _changeSendMessageState(sendMessageState: false);
                          _calculateContainerSize();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: UIcon(
                            UIcons.right_arrow_inline_button,
                            color: UColors.ctaBlue,
                          ),
                        ),
                      ),
              ),
            ),
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
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextField(
                          scrollPhysics: numberOfLines <= 12
                              ? const NeverScrollableScrollPhysics(
                                  parent: RangeMaintainingScrollPhysics())
                              : const ClampingScrollPhysics(),
                          textInputAction: TextInputAction.newline,
                          controller: widget.textEditingController,
                          keyboardType: TextInputType.multiline,
                          style: UTextStyle.H5_fifthHeader.style
                              .returnTextStyleType(color: Colors.white),
                          minLines: 1,
                          maxLines: 12,
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
                                sendMessageState:
                                    value.isNotEmpty ? true : false);
                          },
                          onSubmitted: (value) {
                            _onTextSubmitted(value);
                          },
                        ),
                      ),
                    ),
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
          AnimatedContainer(
            duration: _duration,
            width: widget.textEditingController.text.isEmpty ? 0 : 41,
            padding: const EdgeInsets.only(bottom: 8),
            child: AnimatedOpacity(
              duration: _duration,
              opacity: widget.textEditingController.text.isEmpty ? 0 : 1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox.square(dimension: 17),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        _onTextSubmitted(widget.textEditingController.text);
                      },
                      child: const UIcon(
                        UIcons.chatbar_send_button,
                        color: UColors.ctaBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UChatBarItems extends StatelessWidget {
  const _UChatBarItems({
    Key? key,
    required bool isSendMessageState,
    required this.onTap,
    required this.icon,
    required this.duration,
  })  : _isSendMessageState = isSendMessageState,
        super(key: key);

  final bool _isSendMessageState;
  final UIconData icon;
  final Duration duration;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: duration,
            width: _isSendMessageState ? 0 : 24,
            child: AnimatedOpacity(
              duration: duration,
              opacity: _isSendMessageState ? 0 : 1,
              child: InkWell(
                onTap: onTap,
                child: UIcon(
                  icon,
                  color: UColors.textDark,
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            width: _isSendMessageState ? 0 : 17,
          ),
        ],
      ),
    );
  }
}
