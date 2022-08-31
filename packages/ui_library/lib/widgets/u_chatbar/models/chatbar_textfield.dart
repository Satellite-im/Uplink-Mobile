part of '../u_chatbar.dart';

class _ChatBarTextField extends StatelessWidget {
  const _ChatBarTextField({
    Key? key,
    required this.numberOfLines,
    required bool isSendMessageState,
    required this.onChanged,
    required this.onSubmitted,
    required this.controller,
    required FocusNode focusNode,
  })  : _isSendMessageState = isSendMessageState,
        _focusNode = focusNode,
        super(key: key);

  final int numberOfLines;
  final bool _isSendMessageState;
  final Function(String) onChanged;
  final Function onSubmitted;
  final TextEditingController controller;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: TextField(
          scrollPhysics: numberOfLines <= 12 && _isSendMessageState
              ? const NeverScrollableScrollPhysics(
                  parent: RangeMaintainingScrollPhysics())
              : const BouncingScrollPhysics(),
          textInputAction: TextInputAction.newline,
          controller: controller,
          keyboardType: TextInputType.multiline,
          style: UTextStyle.B1_body.style.returnTextStyleType(
            color: Colors.white,
          ),
          minLines: 1,
          maxLines: 12,
          focusNode: _focusNode,
          cursorColor: UColors.textDark,
          autocorrect: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
            hintText: ULibraryStrings.uChatBarHintText,
            hintStyle: UTextStyle.B1_body.style.returnTextStyleType(
              color: UColors.textDark,
            ),
          ),
          onChanged: (value) {
            onChanged(value);
          },
          onSubmitted: (_) {
            onSubmitted();
          },
        ),
      ),
    );
  }
}
