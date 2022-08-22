import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/view/helpers/build_user_list_tile_long_press.dart';
import 'package:uplink/contacts/add_friend_page/presentation/view/models/user_notifier.dart';
import 'package:uplink/contacts/models/contact_list_tile.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class WithoutFriendRequestBody extends StatefulWidget {
  const WithoutFriendRequestBody({Key? key, required this.user})
      : super(key: key);

  final User user;

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
          name: widget.user.username,
          status: widget.user.status ?? Status.offline,
          statusMessage: widget.user.statusMessage,
          imageAddress: widget.user.profilePicture == null
              ? ''
              : widget.user.profilePicture!.path,
          onTap: () {
            setState(() {
              _isSelected = true;
            });
          },
          trailing: _isSelected
              ? const UIcon(
                  UIcons.checkmark_2,
                  color: UColors.ctaBlue,
                )
              : null,
          onLongPress: () {
            buildUserListTileLongPress(context, widget.user);
          },
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            disabled: !_isSelected,
            label: UAppStrings.addFriend,
            uIconData: UIcons.add_contact,
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
                          text: '${widget.user.username}!',
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
