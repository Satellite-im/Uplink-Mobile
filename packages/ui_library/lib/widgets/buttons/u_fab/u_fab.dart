import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum _FABType { ios, android, big }

class UFAB extends StatelessWidget {
  ///[FloatingActionButton] with '+' icon and rounded rectangle:
  ///```dart
  ///UFAB.ios(onPressed: () {}),
  ///```
  const UFAB.ios({Key? key, required VoidCallback onPressed})
      : _fabType = _FABType.ios,
        _onPressed = onPressed,
        super(key: key);

  ///[FloatingActionButton] with '+' icon and circle border:
  ///```dart
  ///UFAB.android(onPressed: () {}),
  ///```
  const UFAB.android({Key? key, required VoidCallback onPressed})
      : _fabType = _FABType.android,
        _onPressed = onPressed,
        super(key: key);

  ///[FloatingActionButton] with circle border and no icon:
  ///```dart
  ///UFAB.big(onPressed: () {}),
  ///```
  const UFAB.big({Key? key, required VoidCallback onPressed})
      : _fabType = _FABType.big,
        _onPressed = onPressed,
        super(key: key);

  final _FABType _fabType;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    switch (_fabType) {
      case _FABType.ios:
        return FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: UColors.ctaBlue,
          foregroundColor: Colors.white,
          child: const UIcon(UIcons.add_button),
          onPressed: _onPressed,
        );
      case _FABType.android:
        return FloatingActionButton(
          backgroundColor: UColors.ctaBlue,
          foregroundColor: Colors.white,
          child: const UIcon(UIcons.add_button),
          onPressed: _onPressed,
        );
      case _FABType.big:
        return FloatingActionButton(
          backgroundColor: UColors.ctaBlue,
          foregroundColor: Colors.white,
          onPressed: _onPressed,
        );
      default:
        return FloatingActionButton(
          backgroundColor: UColors.ctaBlue,
          foregroundColor: Colors.white,
          onPressed: _onPressed,
        );
    }
  }
}
