// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/user_profile_page/models/network_profiles_body.part.dart';
import 'package:uplink/contacts/user_profile_page/models/profile_data_body.part.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);
// TODO(yijing): get user current state info(through id)
  MockContact user;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late MockContact _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                UAppBar.iconOnly(
                  backIconColor: UColors.white,
                  actionList: [
                    if (_user.relationship == Relationship.friend) ...[
                      IconButton(
                        onPressed: () {},
                        icon: UIcon(UIcons.call),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: UIcon(UIcons.video_call_button),
                      ),
                    ],
                    if (_user.relationship == Relationship.none &&
                        _user.friendRequestSent == true)
                      UIcon(
                        UIcons.outgoing_requests,
                        color: UColors.textDark,
                      ),
                    if (_user.relationship == Relationship.block)
                      UIcon(
                        UIcons.blocked_contacts,
                        color: UColors.textDark,
                      ),
//hamburger menu
                    HamburgerMenuButton(
                      widget: widget,
                      user: _user,
                    ),
                  ],
                  flexibleSpace: const SizedBox(
                    height: 164,
                    width: double.infinity,
                    child: UImage(
                      imagePath: 'lib/utils/mock/images/bannerImage1.png',
                      imageSource: ImageSource.local,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const SizedBox.square(
                        dimension: 114,
                      ),
                      Container(
                        decoration: widget.user.imageAddress == null
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: UColors.backgroundDark,
                                ),
                              )
                            : null,
                        child: SizedBox(
                          width: USizes.userPictureChangeSize,
                          height: USizes.userPictureChangeSize,
                          child: UImage(
                            imagePath: widget.user.imageAddress,
                            imageSource: ImageSource.local,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox.square(
                            dimension: 20,
                          ),
                          UText(
                            widget.user.name,
                            textStyle: UTextStyle.H2_secondaryHeader,
                          ),
                          const SizedBox.square(
                            dimension: 2,
                          ),
                          UText(
                            widget.user.statusMessage ?? '-',
                            textStyle: UTextStyle.B1_body,
                          ),
                          const SizedBox.square(
                            dimension: 16,
                          ),
                          SizedBox(
                            width: _size.width - 32,
                            child: UButton.primary(
                              label: 'Add Friend',
                              uIconData: UIcons.add_contact_member,
                              onPressed: () {
                                // TODO(!!) add button action
                              },
                            ),
                          ),
                          const SizedBox.square(
                            dimension: 16,
                          ),

//grouped info
                          KProfileData(
                            user: widget.user,
                          ),
                          const SizedBox.square(
                            dimension: 24,
                          ),
                          const UDivider(),
                          const SizedBox.square(
                            dimension: 19,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: const [
                                UIcon(
                                  UIcons.about,
                                  color: UColors.textMed,
                                ),
                                SizedBox.square(
                                  dimension: 8,
                                ),
                                UText(
                                  UAppStrings.profileIndexPage_aboutTitle,
                                  textStyle: UTextStyle.H3_tertiaryHeader,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox.square(
                            dimension: 18,
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: UText(
                                widget.user.about == null
                                    ? '-'
                                    : widget.user.about!,
                                textStyle: UTextStyle.B1_body,
                                textColor: UColors.white,
                              ),
                            ),
                          ),
                          const SizedBox.square(
                            dimension: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    UIcon(
                                      UIcons.add_note,
                                      color: UColors.textMed,
                                    ),
                                    SizedBox.square(
                                      dimension: 8,
                                    ),
                                    UText(
                                      'Note',
                                      textStyle: UTextStyle.H3_tertiaryHeader,
                                    ),
                                  ],
                                ),
                                const SizedBox.square(
                                  dimension: 16,
                                ),
                                TextField(
                                  style: UTextStyle.H5_fifthHeader.style
                                      .returnTextStyleType(
                                    color: Colors.white,
                                  ),
                                  textAlignVertical: TextAlignVertical.top,
                                  textInputAction: TextInputAction.done,
                                  cursorColor: UColors.textDark,
                                  autocorrect: false,
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: UColors.foregroundDark,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    hintText: 'Tap to add note',
                                    hintStyle: UTextStyle.H5_fifthHeader.style
                                        .returnTextStyleType(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox.square(
                            dimension: 24,
                          ),
                          const UDivider(),

                          const SizedBox.square(
                            dimension: 20,
                          ),
                          const KNetworkProfiles(
                            networkProfile: NetworkProfiles.spotify,
                            networkUsername:
                                UAppStrings.profileIndexPage_spotifyUsername,
                          ),
                          const SizedBox.square(
                            dimension: 20,
                          ),
                          const KNetworkProfiles(
                            networkProfile: NetworkProfiles.twitch,
                            networkUsername:
                                UAppStrings.profileIndexPage_twitchUsername,
                          ),
                          const SizedBox.square(
                            dimension: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HamburgerMenuButton extends StatelessWidget {
  HamburgerMenuButton({
    Key? key,
    required this.widget,
    required this.user,
  }) : super(key: key);

  final UserProfilePage widget;
  final MockContact user;

  @override
  Widget build(BuildContext context) {
    var model = 'Block';
    if (user.relationship == Relationship.block) model = 'Unblock';

    return UPopupMenuButton<String>(
      icon: const UIcon(UIcons.hamburger_menu),
      onSelected: (String result) async {
        switch (result) {
          case 'Unblock':
            await showDialog<void>(
              context: context,
              builder: (_) => UDialogUserProfile(
                bodyText: 'Are you sure you want to unblock this user?',
                buttonText: UAppStrings.unblock,
                popButtonText: UAppStrings.goBackButton,
                username: user.name,
                statusMessage: user.statusMessage,
                uImage: UImage(
                  imagePath: user.imageAddress,
                  imageSource: ImageSource.local,
                ),
                onTap: () {
                  // !! add unblock workflow
                },
              ),
            );
            break;
          case 'Block':
            await showDialog<void>(
              context: context,
              builder: (_) => UDialogUserProfile(
                bodyText: 'Are you sure you want to block this user?',
                buttonText: UAppStrings.block,
                popButtonText: UAppStrings.goBackButton,
                username: user.name,
                statusMessage: user.statusMessage,
                uImage: UImage(
                  imagePath: user.imageAddress,
                  imageSource: ImageSource.local,
                ),
                onTap: () {
                  // !! add block workflow
                },
              ),
            );
            break;
          case 'Report':
            // TODO(yijing) : add report workflow
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) {
        return <UPopupMenuEntry<String>>[
          UPopupMenuItem<String>(
            padding: EdgeInsets.zero,
            value: model,
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: UText(
                  model,
                  textStyle: UTextStyle.BUT1_primaryButton,
                  textColor: UColors.white,
                ),
              ),
            ),
          ),
          const UPopupMenuItem<String>(
            value: 'Report',
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: UText(
                  'Report',
                  textStyle: UTextStyle.BUT1_primaryButton,
                  textColor: UColors.termRed,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
