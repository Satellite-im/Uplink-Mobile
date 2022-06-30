import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
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
              // rebuild buildFoundUser with new user state
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
              //TODO(yijing): update remove friend request
              UBottomSheetTwoButtons(
                context,
                firstButtonOnPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                secondButtonOnPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
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
                  //rebuild mock contact state
                },
                header: 'Are you sure you want to unsend this friend request?',
                firstButtonText: UAppStrings.cancelButton,
                secondButtonText: UAppStrings.remove,
                secondButtonColor: UColors.termRed,
              ).show();
              // rebuild buildFoundUser with new user state
            },
          ),
        )
      ],
    );
  }
}

Widget buildFoundUser(BuildContext context, {required MockContact user}) {
  // switch (user.relationship) {
  //   case Relationship.block:
  //     break;
  //   case Relationship.friend:
  //     break;
  //   case Relationship.none:

  //     break;
  //   default:
  // }
  if (user.relationship == Relationship.block) {
  } else if (user.relationship == Relationship.friend) {
  } else if (user.relationship == Relationship.none) {
    if (user.friendRequestSent == false) {
      return WithoutFriendRequestBody(user: user);
    } else {
      return WithFriendRequestBody(user: user);
    }
  }

  return Text('test');
}
