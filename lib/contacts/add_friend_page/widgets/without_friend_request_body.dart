import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/models/user_notifier.dart';
import 'package:uplink/contacts/models/contact_list_tile.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

class WithoutFriendRequestBody extends StatefulWidget {
  const WithoutFriendRequestBody({Key? key, required this.user})
      : super(key: key);

  final MockContact user;

  @override
  State<WithoutFriendRequestBody> createState() =>
      _WithoutFriendRequestBodyState();
}

class _WithoutFriendRequestBodyState extends State<WithoutFriendRequestBody> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        ContactListTile(
          name: widget.user.name,
          status: widget.user.status,
          statusMessage: widget.user.statusMessage,
          imageAddress: widget.user.imageAddress,
          onTap: () {
            setState(() {
              _isSelected = true;
            });
          },
          trailing: _isSelected
              ? const UIcon(
                  UIcons.checkmark_rounded,
                  color: UColors.ctaBlue,
                )
              : null,
          onLongPress: () {
            UBottomSheetOptions(
              context,
              sheetTitle: UAppStrings.moreOptions,
              titleList: ['Message', 'Profile', 'Block', 'Report'],
              iconList: [
                UIcons.message,
                UIcons.user_profile,
                UIcons.blocked_contacts,
                UIcons.report
              ],
              onTapList: [
                // TODO(yijing): add message pages
                () {},
                // TODO(yijing): add profile pages
                () {},
                () {
                  final userNotifier = context.read<UserNotifier>();
                  Navigator.of(context, rootNavigator: true).pop();
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                        value: userNotifier,
                        child: UDialogUserProfile(
                          bodyText: 'Are you sure you want to block this user?',
                          buttonText: 'Block',
                          popButtonText: UAppStrings.goBackButton,
                          onTap: () {
                            userNotifier.blockFriend();
                            Navigator.of(context).pop();
                          },
                          username: widget.user.name,
                          imageAddress: widget.user.imageAddress,
                          statusMessage: widget.user.statusMessage,
                          isLocalImage: true,
                        ),
                      );
                    },
                  );
                },
                // TODO(yijing): add report pages
                () {},
              ],
            ).show();
          },
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            disabled: !_isSelected,
            label: UAppStrings.addFriendPage_addFriend,
            uIconData: UIcons.add_contact_member,
            onPressed: () async {
              // TODO(yijing): add send friend request
              context.read<UserNotifier>().sentFriendRequest();
              await showDialog<void>(
                context: context,
                builder: (context) => UDialogSingleButtonCustomBody(
                  title: UAppStrings.withoutFriendRequestBody_sent,
                  body: RichText(
                    text: TextSpan(
                      text: UAppStrings.withoutFriendRequestBody_request,
                      style: UTextStyle.B1_body.style.returnTextStyleType(),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${widget.user.name}!',
                          style: UTextStyle.H4_fourthHeader.style
                              .returnTextStyleType(),
                        ),
                      ],
                    ),
                  ),
                  buttonText: UAppStrings.okay,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
