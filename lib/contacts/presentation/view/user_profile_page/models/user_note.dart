import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/view/user_profile_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class UserNote extends StatelessWidget {
  const UserNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Column(
      children: [
        const UserProfileTitle(
          title: UAppStrings.userNote_note,
          iconData: UIcons.add_note,
        ),
        const SizedBox.square(
          dimension: 16,
        ),
        UTextInput.multiLines(
          controller: controller,
          hintText: UAppStrings.userNote_hintText,
          onChanged: (value) {
            // TODO(yijing): add note feature
          },
        ),
        const SizedBox.square(
          dimension: 24,
        ),
      ],
    );
  }
}
