import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/user_profile_page/user_profile_friends_page.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/data_export.dart';

class UserGroupedInfo extends StatelessWidget {
  const UserGroupedInfo({Key? key, required this.user}) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    //for smaill width screen
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 104,
            child: Column(
              children: [
                const UText(
                  UAppStrings.profileIndexPage_badges,
                  textStyle: UTextStyle.H5_fifthHeader,
                ),
                const SizedBox.square(
                  dimension: 8,
                ),
                if (user.isBlocked == true || user.badgesNum == null)
                  const UText(
                    '-',
                    textStyle: UTextStyle.H5_fifthHeader,
                    textColor: UColors.white,
                  )
                else
                  SizedBox(
                    height: ((user.badgesNum! / 3).ceil() * 24) +
                        ((user.badgesNum! / 3).floor() * 4),
                    width: (3 * 24) + (2 * 4),
                    child: CustomScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      slivers: [
                        SliverGrid.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          children: List.generate(
                            user.badgesNum!,
                            (index) => Container(
                              height: 24,
                              width: 24,
                              color: UColors.defGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          SizedBox(
            width: 104,
            child: Column(
              children: [
                const UText(
                  UAppStrings.profileIndexPage_location,
                  textStyle: UTextStyle.H5_fifthHeader,
                ),
                const SizedBox.square(
                  dimension: 8,
                ),
                UText(
                  user.isBlocked == true || user.location == null
                      ? '-'
                      : user.location!,
                  textStyle: UTextStyle.H5_fifthHeader,
                  textColor: UColors.white,
                ),
              ],
            ),
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          SizedBox(
            width: 104,
            child: Column(
              children: [
                const UText(
                  UAppStrings.profileIndexPage_friends,
                  textStyle: UTextStyle.H5_fifthHeader,
                ),
                SizedBox(
                  height: 30,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (context) => UserProfileFriendPage(
                            user: user,
                          ),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: UText(
                        user.isBlocked == true || user.friendNum == null
                            ? '-'
                            : user.friendNum!.toString(),
                        textStyle: UTextStyle.H5_fifthHeader,
                        textColor: UColors.white,
                      ),
                    ),
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
