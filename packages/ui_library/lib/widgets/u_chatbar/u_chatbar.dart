import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UChatbar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          UIconButton.add(onPressed: onImage),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 7, 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: UColors.foregroundDark),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                          textInputAction: TextInputAction.newline,
                          controller: textEditingController,
                          cursorColor: UColors.textDark,
                          autocorrect: false,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Speak Freely...',
                              //TODO: extract Text Style to UTextStyle
                              hintStyle: TextStyle(
                                fontFamily: UFonts.textPoppinsFont,
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: UColors.textDark,
                              )),
                          onSubmitted: (value) {
                            onMsg(value);
                            textEditingController.clear();
                          })),
                  InkWell(
                    onTap: onSticker,
                    child: const UIcon(
                      UIcons.chatbar_stickers,
                      color: UColors.textDark,
                    ),
                  ),
                  const SizedBox(width: 17),
                  InkWell(
                    onTap: onGif,
                    child: const UIcon(
                      UIcons.chatbar_gifs,
                      color: UColors.textDark,
                    ),
                  ),
                  const SizedBox(width: 17),
                  InkWell(
                    onTap: onEmoji,
                    child: const UIcon(
                      UIcons.chatbar_emojis,
                      color: UColors.textDark,
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
