import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/models/user_notifier.dart';
import 'package:uplink/contacts/models/contact_list_tile.dart';
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
