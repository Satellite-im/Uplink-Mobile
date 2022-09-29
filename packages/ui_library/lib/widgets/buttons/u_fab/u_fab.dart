import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum _FABType { ios, android, large }

class UFAB extends StatelessWidget {
  ///[FloatingActionButton] with '+' icon and rounded rectangle:
  ///```dart
  ///UFAB.android(onPressed: () {}),
  ///```
  const UFAB.android({Key? key, required VoidCallback onPressed})
      : _fabType = _FABType.android,
        _onPressed = onPressed,
        _uIconData = null,
        super(key: key);

  ///[FloatingActionButton] with '+' icon and circle border:
  ///```dart
  ///UFAB.ios(onPressed: () {}),
  ///```
  const UFAB.ios({
    Key? key,
    required VoidCallback onPressed,
  })  : _fabType = _FABType.ios,
        _onPressed = onPressed,
        _uIconData = null,
        super(key: key);

  ///[FloatingActionButton] with circle border and no icon:
  ///```dart
  ///UFAB.large(onPressed: () {}),
  ///```
  const UFAB.large(
      {Key? key, required VoidCallback onPressed, UIconData? uIconData})
      : _fabType = _FABType.large,
        _onPressed = onPressed,
        _uIconData = uIconData,
        super(key: key);

  final _FABType _fabType;
  final VoidCallback _onPressed;
  final UIconData? _uIconData;

  @override
  Widget build(BuildContext context) {
    switch (_fabType) {
      case _FABType.android:
        return FloatingActionButton(
          heroTag: key,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: UColors.ctaBlue,
          foregroundColor: UColors.white,
          child: const UIcon(UIcons.add),
          onPressed: _onPressed,
        );
      case _FABType.ios:
        return FloatingActionButton(
          heroTag: key,
          backgroundColor: UColors.ctaBlue,
          foregroundColor: UColors.white,
          child: const UIcon(UIcons.add),
          onPressed: _onPressed,
        );
      case _FABType.large:
        return FloatingActionButton(
          backgroundColor: UColors.ctaBlue,
          foregroundColor: UColors.white,
          child: _uIconData != null ? UIcon(_uIconData!) : null,
          onPressed: _onPressed,
        );
      default:
        return FloatingActionButton(
          heroTag: key,
          backgroundColor: UColors.ctaBlue,
          foregroundColor: UColors.white,
          child: _uIconData != null ? UIcon(_uIconData!) : null,
          onPressed: _onPressed,
        );
    }
  }
}
