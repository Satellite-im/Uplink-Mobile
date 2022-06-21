// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class NoFriendBody extends StatelessWidget {
  const NoFriendBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...const [
            Center(
              child: UText(
                UAppStrings.noFriendBody_title,
                textStyle: UTextStyle.H1_primaryHeader,
              ),
            ),
            SizedBox(height: 16),
            UText(
              UAppStrings.noFriendBody_body,
              textStyle: UTextStyle.B1_body,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 56),
          ],
          UButton.primary(
            label: UAppStrings.noFriendBody_addFriend,
            uIconData: UIcons.add_contact_member,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const AddFriendPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
