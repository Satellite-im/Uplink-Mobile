import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

//used in friend requests, outgoing requests,and user profile friends pages
class MiniTitleWithNum extends StatelessWidget {
  const MiniTitleWithNum({Key? key, required this.title, required this.num})
      : super(key: key);
  final String title;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        children: [
          UText(
            title,
            textStyle: UTextStyle.H5_fifthHeader,
          ),
          UText(
            num.toString(),
            textStyle: UTextStyle.H5_fifthHeader,
          ),
        ],
      ),
    );
  }
}
