// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/user_profile_page/models/network_profiles_body.part.dart';
import 'package:uplink/contacts/user_profile_page/models/profile_data_body.part.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class UserProfileFriendPage extends StatefulWidget {
  UserProfileFriendPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  String? about;
  MockContact user;

  @override
  State<UserProfileFriendPage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfileFriendPage> {
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
                    UPopupMenuButton<String>(
                      icon: const UIcon(UIcons.hamburger_menu),
                      onSelected: (String result) async {
                        switch (result) {
                          case 'Unblock':
                            await showDialog<void>(
                              context: context,
                              builder: (_) => UDialogUserProfile(
                                bodyText:
                                    'Are you sure you want to unblock this user?',
                                buttonText: 'Unblock',
                                popButtonText: 'Go Back',
                                username: widget.user.name,
                                statusMessage: widget.user.statusMessage,
                                uImage: UImage(
                                  imagePath: widget.user.imageAddress,
                                  imageSource: ImageSource.local,
                                ),
                                onTap: () {},
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
                          const UPopupMenuItem<String>(
                            padding: EdgeInsets.zero,
                            value: 'Unblock',
                            child: SizedBox(
                              width: 160,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: UText(
                                  'Unblock',
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
                    ),
                  ],
                  flexibleSpace: SizedBox(
                    height: 164,
                    width: double.infinity,
                    child: UImage(
                      imagePath: widget.user.bannerImageAddress,
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
