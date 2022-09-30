import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class NoItemBody extends StatelessWidget {
  const NoItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UText(UAppStrings.noItemBody_title,
            textStyle: UTextStyle.H1_primaryHeader),
        const SizedBox(
          height: 16,
        ),
        const UText(
          UAppStrings.noItemBody_content,
          textStyle: UTextStyle.B1_body,
        ),
        const SizedBox(
          height: 56,
        ),
        SizedBox(
          width: double.infinity,
          child: UButton.primary(
            label: UAppStrings.noItemBody_buttonText,
            uIconData: UIcons.document,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
