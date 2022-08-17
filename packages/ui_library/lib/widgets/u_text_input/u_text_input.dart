import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_library/ui_library_export.dart';

enum UTextInputRules { normal, username, messageStatus }

enum UTextInputType {
  singleLine,
  multiLines,
  singleLineWithTitle,
  multiLinesWithTitle
}

class UTextInput extends StatefulWidget {
  const UTextInput.singleLine({
    Key? key,
    TextEditingController? controller,
    required String hintText,
    required Function(String) onChanged,
    bool? autofocus,
    FocusNode? focusNode,
    Function(String)? onSubmitted,
    bool? showErrorForShortUsername,
    this.uTextInputRules = UTextInputRules.normal,
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
    this.uTextInputRules = UTextInputRules.normal,
  })  : _inputType = UTextInputType.multiLines,
        _controller = controller,
        _textFieldTitle = null,
        _hintText = hintText,
        _onChanged = onChanged,
        _autofocus = autofocus ?? false,
        _focusNode = focusNode,
        _onSubmitted = onSubmitted,
        super(key: key);

  const UTextInput.singleLineWithTitle({
    Key? key,
    TextEditingController? controller,
    required String textFieldTitle,
    required String hintText,
    required Function(String) onChanged,
    bool? autofocus,
    FocusNode? focusNode,
    Function(String)? onSubmitted,
    this.uTextInputRules = UTextInputRules.normal,
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
    this.uTextInputRules = UTextInputRules.normal,
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
  final UTextInputRules uTextInputRules;
  final Function(String)? _onSubmitted;

  @override
  State<UTextInput> createState() => UTextInputState();
}

class UTextInputState extends State<UTextInput> {
  bool _showCounterForUsername = false;
  bool _showCounterForMessageStatus = false;
  bool _showErrorTextForShortUsername = false;

  late TextEditingController _textEditingController;

  void startCheckingShortUsernameError() {
    if (_textEditingController.text.length < 5) {
      setState(() {
        _showErrorTextForShortUsername = true;
      });
    }

    _textEditingController.addListener(_listener);
  }

  void _listener() {
    _showErrorTextForShortUsername = _textEditingController.text.isNotEmpty &&
        !(_textEditingController.text.length >= 5);
  }

  @override
  void initState() {
    _textEditingController = widget._controller ?? TextEditingController();
    super.initState();
  }

  void _showCounter(UTextInputRules _uTextInputRules) {
    const _minimumLengthToShowCounterForUsername = 28;
    const _minimumLengthToShowCounterForMessageStatus = 120;

    if (_uTextInputRules == UTextInputRules.username) {
      setState(() {
        _textEditingController.text.length >=
                _minimumLengthToShowCounterForUsername
            ? _showCounterForUsername = true
            : _showCounterForUsername = false;
      });
    }
    if (_uTextInputRules == UTextInputRules.messageStatus) {
      setState(() {
        _textEditingController.text.length >=
                _minimumLengthToShowCounterForMessageStatus
            ? _showCounterForMessageStatus = true
            : _showCounterForMessageStatus = false;
      });
    }
  }

  void resetValues() {
    _textEditingController.removeListener(_listener);
    _showErrorTextForShortUsername = false;
    _showCounterForUsername = false;
    _showCounterForMessageStatus = false;
  }

  @override
  Widget build(BuildContext context) {
    final _isForUsername = widget.uTextInputRules == UTextInputRules.username;
    final _isForMessageStatus =
        widget.uTextInputRules == UTextInputRules.messageStatus;
    const _maximunLenghtForUsername = 32;
    const _maximunLenghtForMessageStatus = 128;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget._inputType == UTextInputType.singleLineWithTitle ||
            widget._inputType == UTextInputType.multiLinesWithTitle) ...[
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: UText(
              widget._textFieldTitle!,
              textStyle: UTextStyle.H3_tertiaryHeader,
            ),
          ),
          const SizedBox.square(dimension: 12),
        ],
        SizedBox(
          height: widget._inputType == UTextInputType.singleLine ||
                  widget._inputType == UTextInputType.singleLineWithTitle
              ? USizes.singleLineHeight
              : USizes.multiLinesHeight,
          child: TextField(
            controller: widget._controller,
            style: UTextStyle.H5_fifthHeader.style.returnTextStyleType(
              color: Colors.white,
            ),
            maxLines: widget._inputType == UTextInputType.singleLine ||
                    widget._inputType == UTextInputType.singleLineWithTitle
                ? USizes.singleLineMaxLines
                : USizes.multiLinesMaxLines,
            textInputAction: TextInputAction.done,
            cursorColor: UColors.white,
            focusNode: widget._focusNode,
            autofocus: widget._autofocus,
            autocorrect: false,
            maxLength: _isForUsername
                ? _maximunLenghtForUsername
                : _isForMessageStatus
                    ? _maximunLenghtForMessageStatus
                    : null,
            inputFormatters: _isForUsername
                ? [
                    FilteringTextInputFormatter.deny(
                      RegExp('@'),
                    ),
                    FilteringTextInputFormatter.allow(
                      RegExp('[A-Za-z0-9\$#+-.!/;:?\'"<>_=(){} []&*]*'),
                    ),
                  ]
                : null,
            onChanged: (value) {
              _showCounter(widget.uTextInputRules);
              widget._onChanged.call(value);
            },
            onSubmitted: widget._onSubmitted,
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: UColors.foregroundDark,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              hintText: widget._hintText,
              hintStyle: UTextStyle.H5_fifthHeader.style.returnTextStyleType(
                  fontStyle: widget._inputType == UTextInputType.multiLines
                      ? FontStyle.italic
                      : FontStyle.normal),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height:
                    _showErrorTextForShortUsername && _isForUsername ? 26 : 0,
                child: _showErrorTextForShortUsername && _isForUsername
                    ? const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                        child: UText(
                          'Minimum character length is 5',
                          textStyle: UTextStyle.B1_body,
                          textColor: UColors.termRed,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedContainer(
                height: _showCounterForUsername || _showCounterForMessageStatus
                    ? 26
                    : 0,
                duration: const Duration(milliseconds: 100),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: UText(
                    '${_textEditingController.text.length}/${_showCounterForUsername ? '$_maximunLenghtForUsername' : '$_maximunLenghtForMessageStatus'}',
                    textStyle: UTextStyle.B1_body,
                    textColor: UColors.textMed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
