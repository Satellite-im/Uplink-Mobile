import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/presentation/view/helper/upload_photo.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class NoItemBody extends StatefulWidget {
  const NoItemBody({
    Key? key,
  }) : super(key: key);

  @override
  State<NoItemBody> createState() => _NoItemBodyState();
}

class _NoItemBodyState extends State<NoItemBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UText(
          UAppStrings.noItemBody_title,
          textStyle: UTextStyle.H1_primaryHeader,
        ),
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
            onPressed: () => uploadPhoto(context),
          ),
        )
      ],
    );
  }
}
