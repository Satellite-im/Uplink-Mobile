import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';
import 'package:ui_library/widgets/u_text/u_text.dart';

class Username extends StatelessWidget {
  const Username({
    Key? key,
    required String username,
    UTextStyle? textStyle,
  })  : _username = username,
        _textStyle = textStyle,
        super(key: key);

  final String _username;

  final UTextStyle? _textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: USizes.userProfileNormalMaxUsernameTextSize,
      child: UText(
        _username,
        textOverflow: TextOverflow.ellipsis,
        maxLines: 1,
        textStyle: _textStyle ?? UTextStyle.M1_micro,
        textColor: UColors.white,
      ),
    );
  }
}
