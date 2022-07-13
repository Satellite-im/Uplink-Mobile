import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/data_export.dart';

class UserAbout extends StatelessWidget {
  const UserAbout({Key? key, required this.user}) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: const [
              UIcon(
                UIcons.about,
                color: UColors.textMed,
              ),
              SizedBox.square(
                dimension: 8,
              ),
              UText(
                UAppStrings.profileIndexPage_aboutTitle,
                textStyle: UTextStyle.H3_tertiaryHeader,
              ),
            ],
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
      ),
    );
  }
}
