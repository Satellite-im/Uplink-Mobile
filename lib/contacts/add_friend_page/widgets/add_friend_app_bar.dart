import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/ui_utils/qr_code_bottom_sheet.dart';

class AddFriendAppBar extends StatelessWidget with PreferredSizeWidget {
  const AddFriendAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UAppBar.actions(
      title: UAppStrings.addFriend,
      actionList: [
        IconButton(
          icon: const UIcon(
            UIcons.qr_code,
            color: UColors.textMed,
          ),
          onPressed: () {
            // qrCodeBottomSheet(
            //   context,
            //   null,
            // ).show();
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
