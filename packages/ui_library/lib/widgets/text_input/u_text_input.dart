import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum UTextInputType {
  singleLine,
  multiLines,
  singleLineWithTitle,
  multiLinesWithTitle
}

class UTextInput extends StatelessWidget {
  const UTextInput.singleLine({
    Key? key,
    TextEditingController? controller,
    required String hintText,
    required Function(String) onChanged,
    bool? autofocus,
    FocusNode? focusNode,
    Function(String)? onSubmitted,
  })  : _inputType = UTextInputType.singleLine,
        _controller = controller,
        _textFieldTitle = null,
        _hintText = hintText,
        _onChanged = onChanged,
        _autofocus = autofocus ?? false,
        _focusNode = focusNode,
        _onSubmitted = onSubmitted,
        super(key: key);

  const UTextInput.multiLines({
    Key? key,
    TextEditingController? controller,
    required String hintText,
    required Function(String) onChanged,
    bool? autofocus,
    FocusNode? focusNode,
    Function(String)? onSubmitted,
  })  : _inputType = UTextInputType.multiLines,
        _controller = controller,
        _textFieldTitle = null,
        _hintText = hintText,
        _onChanged = onChanged,
        _autofocus = autofocus ?? false,
        _focusNode = focusNode,
        _onSubmitted = onSubmitted,
        super(key: key);

  //used in onboardCreateProfile/TextFieldWithAssociativeSeeds
  const UTextInput.singleLineWithTitle({
    Key? key,
    TextEditingController? controller,
    required String textFieldTitle,
    required String hintText,
    required Function(String) onChanged,
    bool? autofocus,
    FocusNode? focusNode,
    Function(String)? onSubmitted,
  })  : _inputType = UTextInputType.singleLineWithTitle,
        _controller = controller,
        _textFieldTitle = textFieldTitle,
        _hintText = hintText,
        _onChanged = onChanged,
        _autofocus = autofocus ?? false,
        _focusNode = focusNode,
        _onSubmitted = onSubmitted,
        super(key: key);

  const UTextInput.multiLinesWithTitle({
    Key? key,
    TextEditingController? controller,
    required String textFieldTitle,
    required String hintText,
    required Function(String) onChanged,
    bool? autofocus,
    FocusNode? focusNode,
    Function(String)? onSubmitted,
  })  : _inputType = UTextInputType.multiLinesWithTitle,
        _controller = controller,
        _textFieldTitle = textFieldTitle,
        _hintText = hintText,
        _onChanged = onChanged,
        _autofocus = autofocus ?? false,
        _focusNode = focusNode,
        _onSubmitted = onSubmitted,
        super(key: key);

  final UTextInputType _inputType;
  final TextEditingController? _controller;
  final String? _textFieldTitle;
  final String _hintText;
  final Function(String) _onChanged;
  final bool _autofocus;
  final FocusNode? _focusNode;
  final Function(String)? _onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_inputType == UTextInputType.singleLineWithTitle ||
            _inputType == UTextInputType.multiLinesWithTitle) ...[
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: UText(
              _textFieldTitle!,
              textStyle: UTextStyle.H3_tertiaryHeader,
            ),
          ),
          const SizedBox.square(dimension: 12),
        ],
        SizedBox(
          height: _inputType == UTextInputType.singleLine ||
                  _inputType == UTextInputType.singleLineWithTitle
              ? 56
              : 87,
          child: TextField(
            controller: _controller,
            style: UTextStyle.H5_fifthHeader.style.returnTextStyleType(
              color: Colors.white,
            ),
            maxLines: _inputType == UTextInputType.singleLine ||
                    _inputType == UTextInputType.singleLineWithTitle
                ? 1
                : 3,
            textInputAction: TextInputAction.done,
            cursorColor: UColors.white,
            focusNode: _focusNode,
            autofocus: _autofocus,
            autocorrect: false,
            onChanged: _onChanged,
            onSubmitted: _onSubmitted,
            decoration: InputDecoration(
              filled: true,
              fillColor: UColors.foregroundDark,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              hintText: _hintText,
              hintStyle: UTextStyle.H5_fifthHeader.style.returnTextStyleType(
                  fontStyle: _inputType == UTextInputType.multiLines
                      ? FontStyle.italic
                      : FontStyle.normal),
            ),
          ),
        ),
      ],
    );
  }
}
