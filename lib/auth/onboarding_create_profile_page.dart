import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/ui_utils/bottom_navigation_bar.dart';

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
    _usernameTextFieldController.dispose();
    _messageStatusTextFieldController.dispose();
    _isSignInButtonEnabled.dispose();
    _scrollController.dispose();
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
          title: UAppStrings.createProfilePage_appBarTitle,
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
                    UAppStrings.createProfilePage_description,
                    textStyle: UTextStyle.B1_body,
                  ),
                  const SizedBox(height: 40),
                  Align(
                    child: UUserPictureChange(
                      uImage: UImage(
                        imagePath: _userPicture?.path,
                        imageSource: ImageSource.file,
                      ),
                      onPictureSelected: (pictureSelected) {
                        setState(() {
                          _userPicture = pictureSelected;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 56),
                  _TextField(
                    textFieldTitle:
                        UAppStrings.createProfilePage_usernameTextFieldTitle,
                    hintText:
                        UAppStrings.createProfilePage_usernameTextFieldHintText,
                    onChanged: (value) {
                      value.isNotEmpty
                          ? _isSignInButtonEnabled.value = true
                          : _isSignInButtonEnabled.value = false;
                    },
                    controller: _usernameTextFieldController,
                  ),
                  const SizedBox.square(dimension: 24),
                  _TextField(
                    textFieldTitle: UAppStrings
                        .createProfilePage_statusMessageTextFieldTitle,
                    hintText: UAppStrings
                        .createProfilePage_statusMessageTextFieldHintText,
                    onChanged: (value) {},
                    controller: _messageStatusTextFieldController,
                  ),
                  const SizedBox.square(dimension: 56),
                  ValueListenableBuilder(
                    valueListenable: _isSignInButtonEnabled,
                    builder: (context, object, widget) {
                      return UButton.primary(
                        label: UAppStrings.createProfilePage_signinButton,
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

    await UBottomSheetTwoButtons(
      context,
      header: _justWithUsernameFilled
          ? UAppStrings.createProfilePage_bottomSheetTitle1
          : _justWithUsernameAndPictureFilled
              ? UAppStrings.createProfilePage_bottomSheetTitle2
              : UAppStrings.createProfilePage_bottomSheetTitle3,
      firstButtonText: UAppStrings.goBackButton,
      secondButtonText: UAppStrings.createProfilePage_allDoneButton,
      firstButtonIcon: UIcons.go_back,
      secondButtonIcon: UIcons.checkmark_2,
      firstButtonOnPressed: () async {
        Navigator.of(context).pop();
      },
      secondButtonOnPressed: () {
        // TODO(yijing): update user log in state
        _setUserLogged();
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const MainBottomNavigationBar(),
          ),
        );
      },
    ).show();
  }
}

Future<void> _setUserLogged() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isUserLogged', true);
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
            style: UTextStyle.H5_fifthHeader.style.returnTextStyleType(
              color: Colors.white,
            ),
            textAlignVertical: TextAlignVertical.top,
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
