import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class OnboardCreateProfilePage extends StatefulWidget {
  const OnboardCreateProfilePage({Key? key}) : super(key: key);

  @override
  State<OnboardCreateProfilePage> createState() =>
      _OnboardCreateProfilePageState();
}

class _OnboardCreateProfilePageState extends State<OnboardCreateProfilePage> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                const SizedBox(height: 30),
                const UText(
                  'Create Profile',
                  textStyle: UTextStyle.H1_primaryHeader,
                ),
                const SizedBox(height: 16),
                const UText(
                  'Sed ut perspiciatis unde omnis iste natus error sit '
                  'voluptatem accusantium doloremque laudantium.',
                  textStyle: UTextStyle.B1_body,
                ),
                const SizedBox(height: 40),
                Align(
                  child: UUserPictureChange(
                    onPictureSelected: (pictureSelected) {
                      print(
                        'AQUI: TESTE ******* ####### ---------- ${pictureSelected?.path}',
                      );
                    },
                  ),
                ),
                const SizedBox(height: 56),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: UText(
                    'Username',
                    textStyle: UTextStyle.H3_tertiaryHeader,
                  ),
                ),
                const SizedBox.square(dimension: 8.4),
                TextField(
                  textInputAction: TextInputAction.newline,
                  // controller: widget.textEditingController,
                  // focusNode: _focusNode,
                  cursorColor: UColors.textDark,
                  autocorrect: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: UColors.foregroundDark,
                    border: InputBorder.none,
                    hintText: 'Digit your username...',
                    hintStyle:
                        UTextStyle.H5_fifthHeader.style.returnTextStyleType(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
