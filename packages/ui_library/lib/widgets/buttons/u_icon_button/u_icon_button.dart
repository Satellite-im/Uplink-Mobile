import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum _CallButtonType { call, end, mute, chat, add, search }

class UIconButton extends StatelessWidget {
  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.call(onPressed: () {}),
  ///```
  const UIconButton.call({Key? key, required VoidCallback onPressed})
      : _callButtonType = _CallButtonType.call,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.end(onPressed: () {}),
  ///```
  const UIconButton.end({Key? key, required VoidCallback onPressed})
      : _callButtonType = _CallButtonType.end,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.mute(onPressed: () {}),
  ///```
  const UIconButton.mute({Key? key, required VoidCallback onPressed})
      : _callButtonType = _CallButtonType.mute,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.chat(onPressed: () {}),
  ///```
  const UIconButton.chat({Key? key, required VoidCallback onPressed})
      : _callButtonType = _CallButtonType.chat,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.add(onPressed: () {}),
  ///```
  const UIconButton.add({Key? key, required VoidCallback onPressed})
      : _callButtonType = _CallButtonType.add,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.search(onPressed: () {}),
  ///```
  const UIconButton.search({Key? key, required VoidCallback onPressed})
      : _callButtonType = _CallButtonType.search,
        _onPressed = onPressed,
        super(key: key);

  final _CallButtonType _callButtonType;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    final double _buttonSize;
    if (_callButtonType == _CallButtonType.search ||
        _callButtonType == _CallButtonType.add) {
      _buttonSize = 40;
    } else {
      _buttonSize = 56;
    }
    return Ink(
      width: _buttonSize,
      height: _buttonSize,
      decoration: getDecoration(),
      child: IconButton(
        color: UColors.white,
        onPressed: _onPressed,
        icon: getUIcon(),
      ),
    );
  }

  UIcon getUIcon() {
    final UIcon _icon;
    switch (_callButtonType) {
      case _CallButtonType.call:
        _icon = const UIcon(UIcons.call);
        break;
      case _CallButtonType.end:
        _icon = const UIcon(UIcons.end_call);
        break;
      case _CallButtonType.mute:
        _icon = const UIcon(UIcons.mute);
        break;
      case _CallButtonType.chat:
        _icon = const UIcon(UIcons.message);
        break;
      case _CallButtonType.add:
        _icon = const UIcon(UIcons.add_button);
        break;
      case _CallButtonType.search:
        _icon = const UIcon(UIcons.search);
        break;
      default:
        _icon = const UIcon(UIcons.call);
    }
    return _icon;
  }

  ShapeDecoration getDecoration() {
    final ShapeDecoration _decoration;
    switch (_callButtonType) {
      case _CallButtonType.call:
        _decoration = const ShapeDecoration(
          color: UColors.onlineGreen,
          shape: CircleBorder(),
        );
        break;
      case _CallButtonType.end:
        _decoration = const ShapeDecoration(
          color: UColors.termRed,
          shape: CircleBorder(),
        );
        break;
      case _CallButtonType.mute:
        _decoration = const ShapeDecoration(
          color: UColors.ctaDark,
          shape: CircleBorder(),
        );
        break;
      case _CallButtonType.chat:
        _decoration = const ShapeDecoration(
          color: UColors.ctaDark,
          shape: CircleBorder(),
        );
        break;
      case _CallButtonType.add:
        _decoration = const ShapeDecoration(
          color: UColors.ctaBlue,
          shape: CircleBorder(),
        );
        break;
      case _CallButtonType.search:
        _decoration = const ShapeDecoration(
          color: UColors.ctaBlue,
          shape: CircleBorder(),
        );
        break;
      default:
        _decoration = const ShapeDecoration(
          color: UColors.onlineGreen,
          shape: CircleBorder(),
        );
    }
    return _decoration;
  }
}
