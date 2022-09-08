// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/add_friend_page/presentation/view/widgets/widgets_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
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
  //In search mode, no user is found
  late TextEditingController _textController;
  String oldIdToSearch = '';
  final _friendController = GetIt.I.get<FriendBloc>();

  @override
  void initState() {
    super.initState();
    _formfieldKey = GlobalKey<FormFieldState<String>>();
    _textController = TextEditingController();
    _textController.addListener(() {
      setState(() {
        if (_textController.text.length == UAppNums.accountIdLength &&
            _disableSearchButton == true) {
          _disableSearchButton = false;
        } else if (_textController.value.text.length !=
                UAppNums.accountIdLength &&
            _disableSearchButton == false) {
          _disableSearchButton = true;
        }
        if (_textController.text != oldIdToSearch) {
          _friendController.user = null;
        }
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();

    _friendController.user = null;
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
                      if (value!.length < UAppNums.accountIdLength &&
                          value.isNotEmpty) {
                        return UAppStrings.addFriendPage_lessCharacters;
                      } else if (value.length > UAppNums.accountIdLength &&
                          value.isNotEmpty) {
                        return UAppStrings.addFriendPage_moreCharacters;
                      }
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
                  BlocBuilder<FriendBloc, FriendState>(
                    bloc: _friendController,
                    builder: (context, state) {
                      if (state is FriendLoadFailure &&
                          oldIdToSearch == _textController.text &&
                          _textController.text.length == 48) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 24,
                            ),
                            UText(
                              UAppStrings.addFriendPage_noAccountFound,
                              textStyle: UTextStyle.B1_body,
                              textColor: UColors.termRed,
                            ),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  BlocBuilder<FriendBloc, FriendState>(
                    bloc: _friendController,
                    builder: (context, state) {
                      if (_friendController.user == null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 56,
                            ),
                            UButton.primary(
                              disabled: _disableSearchButton,
                              label: UAppStrings.search,
                              uIconData: UIcons.search,
                              onPressed: () {
                                oldIdToSearch = _textController.text;
                                _friendController.add(
                                  SearchUserStarted(
                                    userDid: _textController.text,
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<FriendBloc, FriendState>(
              bloc: _friendController,
              builder: (context, state) {
                if (state is FriendLoadSuccess &&
                    _friendController.user != null) {
                  return FoundUserBody(
                    user: _friendController.user!,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
