import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class NoItemBody extends StatelessWidget {
  const NoItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UText('Secure Storage', textStyle: UTextStyle.H1_primaryHeader),
        const SizedBox(
          height: 16,
        ),
        const UText(
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
          textStyle: UTextStyle.B1_body,
        ),
        const SizedBox(
          height: 56,
        ),
        SizedBox(
          width: double.infinity,
          child: UButton.primary(
            label: 'Add a File',
            uIconData: UIcons.document,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
