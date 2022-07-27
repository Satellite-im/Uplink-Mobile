import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum _UIconButtonType { call, end, mute, chat, add, search }

class UIconButton extends StatelessWidget {
  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.call(onPressed: () {}),
  ///```
  const UIconButton.call({Key? key, required VoidCallback onPressed})
      : _iconButtonType = _UIconButtonType.call,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.end(onPressed: () {}),
  ///```
  const UIconButton.end({Key? key, required VoidCallback onPressed})
      : _iconButtonType = _UIconButtonType.end,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.mute(onPressed: () {}),
  ///```
  const UIconButton.mute({Key? key, required VoidCallback onPressed})
      : _iconButtonType = _UIconButtonType.mute,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.chat(onPressed: () {}),
  ///```
  const UIconButton.chat({Key? key, required VoidCallback onPressed})
      : _iconButtonType = _UIconButtonType.chat,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.add(onPressed: () {}),
  ///```
  const UIconButton.add({Key? key, required VoidCallback onPressed})
      : _iconButtonType = _UIconButtonType.add,
        _onPressed = onPressed,
        super(key: key);

  ///[IconButton] with circle border:
  ///```dart
  ///UIconButton.search(onPressed: () {}),
  ///```
  const UIconButton.search({Key? key, required VoidCallback onPressed})
      : _iconButtonType = _UIconButtonType.search,
        _onPressed = onPressed,
        super(key: key);

  final _UIconButtonType _iconButtonType;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    final double _buttonSize;
    if (_iconButtonType == _UIconButtonType.search ||
        _iconButtonType == _UIconButtonType.add) {
      _buttonSize = USizes.buttonSizeSmall;
    } else {
      _buttonSize = USizes.buttonSize;
    }
    return Ink(
      width: _buttonSize,
      height: _buttonSize,
      decoration: getDecoration(),
      child: IconButton(
        splashRadius: _buttonSize / 2,
        color: UColors.white,
        onPressed: _onPressed,
        icon: getUIcon(),
      ),
    );
  }

  UIcon getUIcon() {
    final UIcon _icon;
    switch (_iconButtonType) {
      case _UIconButtonType.call:
        _icon = const UIcon(UIcons.voice_call);
        break;
      case _UIconButtonType.end:
        _icon = const UIcon(UIcons.end_call);
        break;
      case _UIconButtonType.mute:
        _icon = const UIcon(UIcons.mute);
        break;
      case _UIconButtonType.chat:
        _icon = const UIcon(UIcons.message);
        break;
      case _UIconButtonType.add:
        _icon = const UIcon(UIcons.add);
        break;
      case _UIconButtonType.search:
        _icon = const UIcon(UIcons.search);
        break;
      default:
        _icon = const UIcon(UIcons.voice_call);
    }
    return _icon;
  }

  ShapeDecoration getDecoration() {
    final ShapeDecoration _decoration;
    switch (_iconButtonType) {
      case _UIconButtonType.call:
        _decoration = const ShapeDecoration(
          color: UColors.onlineGreen,
          shape: CircleBorder(),
        );
        break;
      case _UIconButtonType.end:
        _decoration = const ShapeDecoration(
          color: UColors.termRed,
          shape: CircleBorder(),
        );
        break;
      case _UIconButtonType.mute:
        _decoration = const ShapeDecoration(
          color: UColors.ctaDark,
          shape: CircleBorder(),
        );
        break;
      case _UIconButtonType.chat:
        _decoration = const ShapeDecoration(
          color: UColors.ctaDark,
          shape: CircleBorder(),
        );
        break;
      case _UIconButtonType.add:
        _decoration = const ShapeDecoration(
          color: UColors.ctaBlue,
          shape: CircleBorder(),
        );
        break;
      case _UIconButtonType.search:
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
