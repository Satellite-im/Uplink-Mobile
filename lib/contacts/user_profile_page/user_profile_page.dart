// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/user_profile_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);
// TODO(yijing): get user current state info(through id)
  final MockContact user;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late MockContact user;
  bool hideInfo = false;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    if (user.isBlocked == true) {
      hideInfo = true;
    }
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
                AppBarWithBanner(user: user),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const SizedBox.square(
                        dimension: 114,
                      ),
                      UserBasicInfo(user: user),
                      const SizedBox.square(
                        dimension: 16,
                      ),

                      SizedBox(
                        width: _size.width - 32,
                        child: CTAButton(
                          user: user,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
