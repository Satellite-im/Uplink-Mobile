import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_library/ui_library_export.dart';

enum _TextFieldType { normal, username, messageStatus }

class UTextField extends StatefulWidget {
  const UTextField({
    Key? key,
    required this.controller,
    required this.textFieldTitle,
    required this.hintText,
    required this.onChanged,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 0),
    this.maxLines = 1,
    this.textFieldHeight = 48,
  })  : _textFieldType = _TextFieldType.normal,
        super(key: key);

  const UTextField.username({
    Key? key,
    required this.controller,
    required this.textFieldTitle,
    required this.hintText,
    required this.onChanged,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 0),
    this.maxLines = 1,
    this.textFieldHeight = 48,
  })  : _textFieldType = _TextFieldType.username,
        super(key: key);

  const UTextField.messageStatus({
    Key? key,
    required this.controller,
    required this.textFieldTitle,
    required this.hintText,
    required this.onChanged,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 0),
    this.maxLines = 1,
    this.textFieldHeight = 48,
  })  : _textFieldType = _TextFieldType.messageStatus,
        super(key: key);

  final TextEditingController controller;
  final String textFieldTitle;
  final String hintText;
  final EdgeInsets padding;
  final int maxLines;

  final double textFieldHeight;
  final Function(String) onChanged;
  final _TextFieldType _textFieldType;

  @override
  State<UTextField> createState() => _UTextFieldState();
}

class _UTextFieldState extends State<UTextField> with TickerProviderStateMixin {
  bool _showCounterForUsername = false;
  bool _showCounterForMessageStatus = false;
  bool _showErrorTextForShortUsername = false;
  Timer _timerToShowErrorTextForShortUsername =
      Timer(const Duration(milliseconds: 2500), () {});

  void _showCounter(_TextFieldType _textFieldType) {
    const _minimumLengthToShowCounterForUsername = 28;
    const _minimumLengthToShowCounterForMessageStatus = 120;

    if (_textFieldType == _TextFieldType.username) {
      setState(() {
        widget.controller.text.length >= _minimumLengthToShowCounterForUsername
            ? _showCounterForUsername = true
            : _showCounterForUsername = false;
      });
    }
    if (_textFieldType == _TextFieldType.messageStatus) {
      setState(() {
        widget.controller.text.length >=
                _minimumLengthToShowCounterForMessageStatus
            ? _showCounterForMessageStatus = true
            : _showCounterForMessageStatus = false;
      });
    }
  }

  void _messageErrorForMinimumCharInUsername(_TextFieldType _textFieldType) {
    _timerToShowErrorTextForShortUsername.cancel();

    if (_textFieldType == _TextFieldType.username &&
        widget.controller.text.length < 5) {
      _timerToShowErrorTextForShortUsername =
          Timer(const Duration(milliseconds: 2500), () {
        _showErrorTextForShortUsername = true;
        setState(() {});
      });
    } else {
      _showErrorTextForShortUsername = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _isForUsername = widget._textFieldType == _TextFieldType.username;
    final _isForMessageStatus =
        widget._textFieldType == _TextFieldType.messageStatus;
    const _maximunLenghtForUsername = 32;
    const _maximunLenghtForMessageStatus = 128;

    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: UText(
              widget.textFieldTitle,
              textStyle: UTextStyle.H3_tertiaryHeader,
            ),
          ),
          const SizedBox.square(dimension: 8.4),
          SizedBox(
            height: widget.textFieldHeight,
            child: TextFormField(
              controller: widget.controller,
              style: UTextStyle.H5_fifthHeader.style.returnTextStyleType(
                color: Colors.white,
              ),
              textAlignVertical: TextAlignVertical.top,
              textInputAction: TextInputAction.done,
              cursorColor: UColors.textDark,
              maxLines: widget.maxLines,
              validator: (value) {
                if (_isForUsername && widget.controller.text.length < 5) {
                  return 'Minimum character length is 5';
                }
                return null;
              },
              maxLength: _isForUsername
                  ? _maximunLenghtForUsername
                  : _isForMessageStatus
                      ? _maximunLenghtForMessageStatus
                      : null,
              autocorrect: false,
              onChanged: (value) {
                _messageErrorForMinimumCharInUsername(widget._textFieldType);
                _showCounter(widget._textFieldType);
                widget.onChanged.call(value);
              },
              inputFormatters: _isForUsername
                  ? [
                      FilteringTextInputFormatter.deny(
                        RegExp('@'),
                      ),
                      FilteringTextInputFormatter.allow(
                        RegExp('[A-Za-z0-9\$#+-.!/;:?\'"<>_=(){}[]&*]*'),
                      ),
                    ]
                  : null,
              decoration: InputDecoration(
                filled: true,
                counterText: '',
                fillColor: UColors.foregroundDark,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                hintText: widget.hintText,
                hintStyle:
                    UTextStyle.H5_fifthHeader.style.returnTextStyleType(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  child: _showErrorTextForShortUsername
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
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  child: _showCounterForUsername || _showCounterForMessageStatus
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: UText(
                            '${widget.controller.text.length}/${_showCounterForUsername ? '$_maximunLenghtForUsername' : '$_maximunLenghtForMessageStatus'}',
                            textStyle: UTextStyle.B1_body,
                            textColor: UColors.textMed,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
