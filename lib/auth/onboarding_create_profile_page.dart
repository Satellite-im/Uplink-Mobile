import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';

class OnboardCreateProfilePage extends StatefulWidget {
  const OnboardCreateProfilePage({Key? key}) : super(key: key);

  @override
  State<OnboardCreateProfilePage> createState() =>
      _OnboardCreateProfilePageState();
}

class _OnboardCreateProfilePageState extends State<OnboardCreateProfilePage> {
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();
  final _isSignInButtonEnabled = ValueNotifier<bool>(false);
  final _usernameTextFieldController = TextEditingController();
  final _messageStatusTextFieldController = TextEditingController();
  File? _userPicture;

  void _dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 40 &&
          _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        _dismissKeyboard();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismissKeyboard,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: UAppBar.back(
          title: 'Create Profile',
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: SingleChildScrollView(
              controller: _scrollController,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                        _userPicture = pictureSelected;
                      },
                    ),
                  ),
                  const SizedBox(height: 56),
                  _TextField(
                    textFieldTitle: 'Username',
                    hintText: 'Digit your username...',
                    onChanged: (value) {
                      value.isNotEmpty
                          ? _isSignInButtonEnabled.value = true
                          : _isSignInButtonEnabled.value = false;
                    },
                    controller: _usernameTextFieldController,
                  ),
                  const SizedBox.square(dimension: 24),
                  _TextField(
                    textFieldTitle: 'Status Message',
                    hintText: 'Digit your status message...',
                    onChanged: (value) {},
                    controller: _messageStatusTextFieldController,
                  ),
                  const SizedBox.square(dimension: 56),
                  ValueListenableBuilder(
                    valueListenable: _isSignInButtonEnabled,
                    builder: (context, object, widget) {
                      return UButton.primary(
                        label: 'Sign in',
                        disabled: !_isSignInButtonEnabled.value,
                        uIconData: UIcons.friend_added,
                        onPressed: () async {
                          await _callBottomSheets();
                        },
                      );
                    },
                  ),
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 50),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _callBottomSheets() async {
    final _justWithUsernameFilled =
        _usernameTextFieldController.text.isNotEmpty &&
            _messageStatusTextFieldController.text.isEmpty &&
            _userPicture == null;
    final _justWithUsernameAndPictureFilled =
        _usernameTextFieldController.text.isNotEmpty &&
            _messageStatusTextFieldController.text.isEmpty &&
            _userPicture != null;
    const _justUsernameFilledTitle = 'Do you want to save your changes? \n'
        'You can always add your avatar and status message later.';
    const _justWithUsernameAndPictureFilledTitle =
        'Do you want to save your changes? \n'
        'You can always add your status message later.';
    const _allOptionsFilledTitle = 'Do you want to save your changes? ';

    await UBottomSheetTwoButtons(
      context,
      header: _justWithUsernameFilled
          ? _justUsernameFilledTitle
          : _justWithUsernameAndPictureFilled
              ? _justWithUsernameAndPictureFilledTitle
              : _allOptionsFilledTitle,
      firstButtonText: 'Go back',
      secondButtonText: 'All done',
      // TODO: Add reply Icon from Figma
      firstButtonIcon: UIcons.back_arrow_button,
      secondButtonIcon: UIcons.checkmark_rounded,
      firstButtonOnPressed: () async {
        Navigator.of(context).pop();
      },
      secondButtonOnPressed: () async {
        // TODO: Continue to loading page liking satellites
      },
    ).show();
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    Key? key,
    required this.controller,
    required this.textFieldTitle,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final String textFieldTitle;
  final String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: UText(
            textFieldTitle,
            textStyle: UTextStyle.H3_tertiaryHeader,
          ),
        ),
        const SizedBox.square(dimension: 8.4),
        SizedBox(
          height: 48,
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.done,
            cursorColor: UColors.textDark,
            autocorrect: false,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: UColors.foregroundDark,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4),
              ),
              hintText: hintText,
              hintStyle: UTextStyle.H5_fifthHeader.style.returnTextStyleType(),
            ),
          ),
        ),
      ],
    );
  }
}
