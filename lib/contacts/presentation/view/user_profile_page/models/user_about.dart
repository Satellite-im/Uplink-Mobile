import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/view/user_profile_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class UserAbout extends StatelessWidget {
  const UserAbout({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserProfileTitle(
          title: UAppStrings.profileIndexPage_aboutTitle,
          iconData: UIcons.about,
        ),
        const SizedBox.square(
          dimension: 18,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: UText(
            (user.isBlocked == true) || (user.about == null)
                ? '-'
                : user.about!,
            textStyle: UTextStyle.B1_body,
            textColor: UColors.white,
          ),
        ),
      ],
    );
  }
}
