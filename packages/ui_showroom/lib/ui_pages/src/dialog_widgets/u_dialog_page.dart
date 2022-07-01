import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UDialogPage extends StatelessWidget {
  const UDialogPage({Key? key}) : super(key: key);

  static const routeName = '/UDialog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: Column(
          children: [
            UButton.filled1(
              label: 'show UDialogSingleButton',
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (_) => const UDialogSingleButton(
                          title: 'Saved!',
                          bodyText:
                              'This screenshot was saved to your phone gallery.',
                          buttonText: 'Okay',
                        ));
              },
            ),
            UButton.filled1(
              label: 'show UDialogDoubleButtons',
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (_) => UDialogDoubleButtons(
                        title: 'Switch Accounts',
                        bodyText:
                            'Are you sure you want to switch accounts?\nYou’ll need your passphrases or Pin code to sign back in.',
                        buttonText: 'Continue',
                        popUpButtonText: 'Go Back',
                        onTap: () {}));
              },
            ),
            UButton.filled1(
              label: 'show UDialogUserProfile',
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (_) => UDialogUserProfile(
                        bodyText: 'Are you sure you want to unblock this user?',
                        buttonText: 'Unblock',
                        popButtonText: 'Go Back',
                        username: 'username',
                        statusMessage: 'Something something space station',
                        uImage: const UImage(
                          imagePath:
                              'packages/ui_library/images/placeholders/user_avatar_7.png',
                          imageSource: ImageSource.local,
                        ),
                        onTap: () {}));
              },
            ),
          ],
        ),
      ),
    );
  }
}
