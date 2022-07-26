import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/user_profile_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class UserNote extends StatelessWidget {
  const UserNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserProfileTitle(
          title: UAppStrings.userNote_note,
          iconData: UIcons.add_note,
        ),
        const SizedBox.square(
          dimension: 16,
        ),
        TextField(
          style: UTextStyle.H5_fifthHeader.style.returnTextStyleType(
            color: Colors.white,
          ),
          textAlignVertical: TextAlignVertical.top,
          textInputAction: TextInputAction.done,
          cursorColor: UColors.textDark,
          autocorrect: false,
          onChanged: (value) {},
          decoration: InputDecoration(
            filled: true,
            fillColor: UColors.foregroundDark,
            contentPadding: const EdgeInsets.fromLTRB(16, 17, 16, 16),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
            hintText: UAppStrings.userNote_hintText,
            hintStyle: UTextStyle.H5_fifthHeader.style.returnTextStyleType(
              fontStyle: FontStyle.italic,
            ),
          ),
          maxLines: 3,
        ),
        const SizedBox.square(
          dimension: 24,
        ),
      ],
    );
  }
}
