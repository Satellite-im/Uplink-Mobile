import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ui_library/ui_library_export.dart';

class OnboardCreateProfilePage extends StatefulWidget {
  const OnboardCreateProfilePage({Key? key}) : super(key: key);

  @override
  State<OnboardCreateProfilePage> createState() =>
      _OnboardCreateProfilePageState();
}

class _OnboardCreateProfilePageState extends State<OnboardCreateProfilePage> {
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 40 &&
          _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        FocusManager.instance.primaryFocus?.unfocus();
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
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: UAppBar.back(title: 'Create Profile'),
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
                      onPictureSelected: (pictureSelected) {},
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
                  SizedBox(
                    height: 48,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      cursorColor: UColors.textDark,
                      autocorrect: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: UColors.foregroundDark,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: 'Digit your username...',
                        hintStyle: UTextStyle.H5_fifthHeader.style
                            .returnTextStyleType(),
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 24),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: UText(
                      'Status Message',
                      textStyle: UTextStyle.H3_tertiaryHeader,
                    ),
                  ),
                  const SizedBox.square(dimension: 8.4),
                  SizedBox(
                    height: 48,
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      cursorColor: UColors.textDark,
                      autocorrect: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: UColors.foregroundDark,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: 'Digit your status message...',
                        hintStyle: UTextStyle.H5_fifthHeader.style
                            .returnTextStyleType(),
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 56),
                  UButton.primary(
                    label: 'Sign in',
                    uIconData: UIcons.friend_added,
                    onPressed: () {},
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
}
