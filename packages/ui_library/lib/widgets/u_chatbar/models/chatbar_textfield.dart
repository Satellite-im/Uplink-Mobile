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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: TextField(
            scrollPhysics: numberOfLines <= 12 && _isSendMessageState
                ? const NeverScrollableScrollPhysics(
                    parent: RangeMaintainingScrollPhysics())
                : const BouncingScrollPhysics(),
            textInputAction: TextInputAction.newline,
            controller: controller,
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
              hintStyle: UTextStyle.H5_fifthHeader.style.returnTextStyleType(),
            ),
            onChanged: (value) {
              onChanged(value);
            },
            onSubmitted: (_) {
              onSubmitted();
            },
          ),
        ),
      ),
    );
  }
}
