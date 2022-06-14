// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

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
                'No Friends Yet',
                textStyle: UTextStyle.H1_primaryHeader,
              ),
            ),
            SizedBox(height: 16),
            UText(
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
              textStyle: UTextStyle.B1_body,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 56),
          ],
          UButton.primary(
            label: 'Add a Friend',
            uIconData: UIcons.add_contact_member,
            onPressed: () {
              // TODO(yijing): add friends pages
            },
          ),
        ],
      ),
    );
  }
}
