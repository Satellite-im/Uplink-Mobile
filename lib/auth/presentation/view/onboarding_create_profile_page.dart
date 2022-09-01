import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/utils/ui_utils/bottom_navigation_bar.dart';

class OnboardCreateProfilePage extends StatefulWidget {
  const OnboardCreateProfilePage({Key? key}) : super(key: key);

  @override
  State<OnboardCreateProfilePage> createState() =>
      _OnboardCreateProfilePageState();
}

class _OnboardCreateProfilePageState extends State<OnboardCreateProfilePage> {
  final _uTextInputStateForUsernameField = GlobalKey<UTextInputState>();
  final _uTextInputStateForMessageStatusField = GlobalKey<UTextInputState>();
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
    _uTextInputStateForUsernameField.currentState?.dispose();
    _uTextInputStateForMessageStatusField.currentState?.dispose();
    super.dispose();
  }

  final _authController = GetIt.I.get<AuthBloc>();

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
                  UTextInput.singleLineWithTitle(
                    key: _uTextInputStateForUsernameField,
                    controller: _usernameTextFieldController,
                    uTextInputRules: UTextInputRules.username,
                    textFieldTitle:
                        UAppStrings.createProfilePage_usernameTextFieldTitle,
                    hintText:
                        UAppStrings.createProfilePage_usernameTextFieldHintText,
                    onChanged: (value) {
                      value.isNotEmpty
                          ? _isSignInButtonEnabled.value = true
                          : _isSignInButtonEnabled.value = false;
                    },
                  ),
                  const SizedBox.square(dimension: 24),
                  UTextInput.singleLineWithTitle(
                    key: _uTextInputStateForMessageStatusField,
                    controller: _messageStatusTextFieldController,
                    uTextInputRules: UTextInputRules.messageStatus,
                    textFieldTitle: UAppStrings
                        .createProfilePage_statusMessageTextFieldTitle,
                    hintText: UAppStrings
                        .createProfilePage_statusMessageTextFieldHintText,
                    onChanged: (value) {},
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
                          if (_usernameTextFieldController.text.isNotEmpty &&
                              _usernameTextFieldController.text.length < 5) {
                            _uTextInputStateForUsernameField.currentState!
                                .startCheckingShortUsernameError();
                          } else if (_usernameTextFieldController.text.length >=
                              5) {
                            await _callBottomSheets();
                          }
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
        // TODO(yijing): add loading page
        _authController
          ..add(
            AuthCreateCurrentUser(
              currentUser: CurrentUser.newUser(
                username: _usernameTextFieldController.text,
                statusMessage: _messageStatusTextFieldController.text,
                profilePicture: _userPicture,
              ),
            ),
          )
          ..add(
            AuthSetPinData(),
          );

        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const MainBottomNavigationBar(),
          ),
        );
      },
    ).show();
  }
}
