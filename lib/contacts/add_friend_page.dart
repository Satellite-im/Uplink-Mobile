// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/utils/ui_utils/qr_code_bottom_sheet.dart';

class AddFriendPage extends StatelessWidget {
  const AddFriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        title: 'Add Friend',
        actionList: [
          IconButton(
            icon: const UIcon(
              UIcons.qr_code,
              color: UColors.textMed,
            ),
            onPressed: () {
              qrCodeBottomSheet(
                context,
                null,
              ).show();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: const [
                UIcon(UIcons.account_id),
                SizedBox(width: 9),
                UText(
                  'Your Account ID',
                  textStyle: UTextStyle.H3_tertiaryHeader,
                )
              ],
            ),
            const SizedBox(height: 16),
            const UText(
              'Make new friends by tapping your account ID to copy and share.',
              textStyle: UTextStyle.B1_body,
              textColor: UColors.white,
            ),
            const SizedBox(height: 24),
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: UColors.foregroundDark,
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                // TODO(yijing): update to account ID
                child: UText(
                  'pBr8xM9WKfbGnLK8EJEiKEivBhBos5EDdJv5Wzbib94',
                  textStyle: UTextStyle.H5_fifthHeader,
                  textColor: UColors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const UDivider(),
            const SizedBox(height: 16),
            const UText(
              'Enter your friend’s account ID or username, or scan their QR code to find their account. Account ID’s are case sensitive.',
              textStyle: UTextStyle.B1_body,
            ),
            const SizedBox(height: 24),
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: UColors.foregroundDark,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Account ID',
                  filled: true,
                  fillColor: UColors.foregroundDark,
                ),
              ),
            ),
            const SizedBox(height: 56),
            UButton.primary(
              label: 'Search',
              uIconData: UIcons.search,
              // TODO(yijing): add search work flow
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
