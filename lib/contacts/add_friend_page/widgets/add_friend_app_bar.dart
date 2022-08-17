import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/utils/ui_utils/qr_code/qr_code_bottom_sheet.dart';

class AddFriendAppBar extends StatelessWidget with PreferredSizeWidget {
  const AddFriendAppBar({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final CurrentUser currentUser;

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
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              useRootNavigator: true,
              builder: (context) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                child: GestureDetector(
                  onTap: () {},
                  child: QRCodeBottomSheet(
                    currentUser: currentUser,
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
