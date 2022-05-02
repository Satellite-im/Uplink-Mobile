import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_colors.dart';

class UserProfilePlaceHolder extends StatelessWidget {
  const UserProfilePlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/ui_library/images/placeholders/user_avatar_2.png',
      errorBuilder: (context, error, stackTrace) => const _Container(),
      frameBuilder: (context, child, inter, wasSynchronouslyLoaded) =>
          _Container(
        child: child,
      ),
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: UColors.defGrey,
      ),
      child: child,
    );
  }
}
