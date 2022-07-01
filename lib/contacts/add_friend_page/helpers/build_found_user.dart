// ignore_for_file: no_default_cases

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/add_friend_page.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

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
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            disabled: !_isSelected,
            label: 'Add Friend',
            uIconData: UIcons.add_contact_member,
            onPressed: () async {
              //TODO(yijing): add send friend request
              context.read<UserNotifier>().sentFriendRequest();
              await showDialog<void>(
                context: context,
                builder: (context) => UDialogSingleButtonCustomBody(
                  title: 'Friend Request Sent',
                  body: RichText(
                    text: TextSpan(
                      text: 'Your request was sent to ',
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
                  buttonText: 'Okay',
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class WithFriendRequestBody extends StatelessWidget {
  const WithFriendRequestBody({Key? key, required this.user}) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        ContactListTile(
            name: user.name,
            status: user.status,
            statusMessage: user.statusMessage,
            imageAddress: user.imageAddress,
            onTap: () {},
            trailing: const UIcon(
              UIcons.outgoing_requests,
              color: UColors.textDark,
            )),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            label: 'Undo Request',
            uIconData: UIcons.remove_friend,
            onPressed: () {
              UBottomSheetTwoButtons(
                context,
                firstButtonOnPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                secondButtonOnPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                  //TODO(yijing): update undo friend request
                  context.read<UserNotifier>().undoFriendRequest();
                  await showDialog<void>(
                    context: context,
                    builder: (context) => UDialogSingleButtonCustomBody(
                      title: 'Friend Request Removed',
                      body: RichText(
                        text: TextSpan(
                          text: 'Your request to ',
                          style: UTextStyle.B1_body.style.returnTextStyleType(),
                          children: <TextSpan>[
                            TextSpan(
                              text: user.name,
                              style: UTextStyle.H4_fourthHeader.style
                                  .returnTextStyleType(),
                            ),
                            const TextSpan(text: ' was removed.'),
                          ],
                        ),
                      ),
                      buttonText: 'Okay',
                    ),
                  );
                },
                header: 'Are you sure you want to unsend this friend request?',
                firstButtonText: UAppStrings.cancelButton,
                secondButtonText: UAppStrings.remove,
                secondButtonColor: UColors.termRed,
              ).show();
            },
          ),
        )
      ],
    );
  }
}

class FriendBody extends StatelessWidget {
  const FriendBody({Key? key, required this.user}) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        ContactListTile(
          name: user.name,
          status: user.status,
          statusMessage: user.statusMessage,
          imageAddress: user.imageAddress,
          onTap: () {},
          trailing: const UIcon(
            UIcons.friend_added,
            color: UColors.textDark,
          ),
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            label: 'Remove Friend',
            uIconData: UIcons.remove_friend,
            color: UColors.termRed,
            onPressed: () {
              final userNotifier = context.read<UserNotifier>();
              //Dialog widget cut the route of context, so we need to get the existing UserNotifier and expose it to the dialog widget.
              showDialog<void>(
                context: context,
                builder: (context) {
                  return ChangeNotifierProvider.value(
                    value: userNotifier,
                    child: UDialogUserProfile(
                      bodyText:
                          'Are you sure you want to remove this user from your Contact’s list?',
                      buttonText: UAppStrings.remove,
                      buttonColor: UColors.termRed,
                      popButtonText: 'Go Back',
                      onTap: () {
                        userNotifier.removeFriend();
                        Navigator.of(context).pop();
                      },
                      username: user.name,
                      uImage: UImage(
                        imageSource: ImageSource.local,
                        imagePath: user.imageAddress,
                      ),
                      statusMessage: user.statusMessage,
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class BlockedBody extends StatelessWidget {
  const BlockedBody({Key? key, required this.user}) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        ContactListTile(
          name: user.name,
          status: user.status,
          statusMessage: user.statusMessage,
          imageAddress: user.imageAddress,
          onTap: () {},
          trailing: const UIcon(
            UIcons.blocked_contacts,
            color: UColors.textDark,
          ),
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            label: 'Unblock',
            uIconData: UIcons.blocked_contacts,
            color: UColors.termRed,
            onPressed: () {
              final userNotifier = context.read<UserNotifier>();
              //Dialog widget cut the route of context, so we need to get
              //the existing UserNotifier and expose it to the dialog widget.
              showDialog<void>(
                context: context,
                builder: (context) {
                  return ChangeNotifierProvider.value(
                    value: userNotifier,
                    child: UDialogUserProfile(
                      bodyText: 'Are you sure you want to unblock this user?',
                      buttonText: 'Unblock',
                      popButtonText: 'Go Back',
                      onTap: () {
                        userNotifier.unblockFriend();
                        Navigator.of(context).pop();
                      },
                      username: user.name,
                      uImage: UImage(
                        imageSource: ImageSource.local,
                        imagePath: user.imageAddress,
                      ),
                      statusMessage: user.statusMessage,
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class FoundUserBody extends StatelessWidget {
  const FoundUserBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserNotifier>().user;

    switch (user.relationship) {
      case Relationship.block:
        return BlockedBody(user: user);
      case Relationship.friend:
        return FriendBody(user: user);
      case Relationship.none:
        if (user.friendRequestSent == false) {
          return WithoutFriendRequestBody(user: user);
        } else {
          return WithFriendRequestBody(user: user);
        }
      default:
        return WithoutFriendRequestBody(user: user);
    }
  }
}
