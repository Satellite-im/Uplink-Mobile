// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/controller/add_friend_bloc.dart';
import 'package:uplink/contacts/add_friend_page/presentation/view/models/models_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/view/widgets/widgets_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
import 'package:uplink/utils/mock/data/data_export.dart';
import 'package:uplink/utils/utils_export.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  late GlobalKey<FormFieldState<String>> _formfieldKey;
  bool _disableSearchButton = false;
  //In search mode,someone is found
  bool _isFound = false;
  //In search mode, no user is found
  bool _showNoUserError = false;
  late TextEditingController _textController;
  final _addFriendController = GetIt.I.get<AddFriendBloc>();

  @override
  void initState() {
    super.initState();
    _formfieldKey = GlobalKey<FormFieldState<String>>();
    _textController = TextEditingController();
    _textController.addListener(() {
      if (_textController.text.length == UAppNums.accountIdLength &&
          _disableSearchButton == true) {
        //when text length is 43, light up button
        setState(() {
          _disableSearchButton = false;
        });
      } else if (_textController.value.text.length !=
              UAppNums.accountIdLength &&
          _disableSearchButton == false) {
        //after user search the wrong user and want to change the text
        setState(() {
          _disableSearchButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddFriendAppBar(
        currentUser: GetIt.I.get<UpdateCurrentUserBloc>().currentUser!,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CopyIDTextField(),
            ),
            const UDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  const UText(
                    UAppStrings.addFriendPage_userAccount,
                    textStyle: UTextStyle.B1_body,
                  ),
                  const SizedBox(height: 24),
                  FormField<String>(
                    key: _formfieldKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      // if (value!.length < UAppNums.accountIdLength &&
                      //     value.isNotEmpty) {
                      //   return UAppStrings.addFriendPage_lessCharacters;
                      // } else if (value.length > UAppNums.accountIdLength &&
                      //     value.isNotEmpty) {
                      //   return UAppStrings.addFriendPage_moreCharacters;
                      // }
                      return null;
                    },
                    builder: (FormFieldState<String> state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: UColors.foregroundDark,
                            ),
                            child: TextField(
                              controller: _textController,
                              onChanged: (value) {
                                state.didChange(value);
                                if (_isFound) _isFound = false;
                                if (_showNoUserError) {
                                  _showNoUserError = false;
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: UAppStrings.addFriendPage_hint,
                              ),
                              keyboardType: TextInputType.none,
                              style:
                                  UTextStyle.M1_micro.style.returnTextStyleType(
                                color: UColors.white,
                              ),
                            ),
                          ),
                          if (state.hasError) ...[
                            const SizedBox(
                              height: 24,
                            ),
                            UText(
                              state.errorText.toString(),
                              textStyle: UTextStyle.B1_body,
                              textColor: UColors.termRed,
                            )
                          ]
                        ],
                      );
                    },
                  ),
                  if (_showNoUserError) ...[
                    const SizedBox(
                      height: 24,
                    ),
                    const UText(
                      UAppStrings.addFriendPage_noAccountFound,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.termRed,
                    )
                  ] else
                    const SizedBox.shrink(),
                  if (!_isFound) ...[
                    const SizedBox(height: 56),
                    UButton.primary(
                      disabled: _disableSearchButton,
                      label: UAppStrings.search,
                      uIconData: UIcons.search,
                      onPressed: () async {
                        _addFriendController.add(
                          SearchUser(userDid: _textController.text),
                        );
                        if (_formfieldKey.currentState!.validate()) {
                          // TODO(yijing): update search account ID
                          setState(() {
                            if (_addFriendController.user != null) {
                              _isFound = true;
                            } else {
                              _showNoUserError = true;
                            }
                          });
                        }
                      },
                    )
                  ]
                ],
              ),
            ),
            // TODO(demo): change user type here to see different scenarios
            if (_isFound)
              ChangeNotifierProvider(
                create: (context) =>
                    UserNotifier(blockedUserWithoutFriendRequest),
                builder: (context, child) => FoundUserBody(
                  user: _addFriendController.user!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
