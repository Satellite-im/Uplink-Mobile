// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/view/models/models_export.dart';
import 'package:uplink/contacts/presentation/view/user_profile_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/mock/helpers/helpers_export.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class UserProfileFriendPage extends StatelessWidget {
  const UserProfileFriendPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                AppBarWithBanner(
                  user: user,
                  backButtonOpacity: 1,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const SizedBox.square(
                        dimension: 114,
                      ),
                      UserBasicInfo(user: user),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox.square(
                  dimension: 16,
                ),
                UserProfileTitle(
                  title: 'Friends',
                  iconData: UIcons.menu_bar_contacts,
                ),
                const SizedBox.square(
                  dimension: 16,
                ),
              ]),
            ),
          ),
          FutureBuilder<List<MockContact>>(
            future: loadingOnlineFriendsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final onlineFriendList = snapshot.data!;
                if (onlineFriendList.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: const [
                        MiniTitleWithNum(
                          title: 'Online - ',
                          num: 0,
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = onlineFriendList[index];

                        return Column(
                          children: [
                            if (index == 0)
                              MiniTitleWithNum(
                                title: 'Online - ',
                                num: onlineFriendList.length,
                              ),
                            ContactListTile(
                              name: item.name,
                              status: item.status,
                              statusMessage: item.statusMessage,
                              imageAddress: item.imageAddress,
                              onTap: () {},
                            )
                          ],
                        );
                      },
                      childCount: onlineFriendList.length,
                    ),
                  );
                }
              }
              return SliverToBoxAdapter(
                child: const Center(child: ULoadingIndicator()),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: UDivider(height: 1),
          ),
          FutureBuilder<List<MockContact>>(
            future: loadingOfflineFriendsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final offlineFriendList = snapshot.data!;
                if (offlineFriendList.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: MiniTitleWithNum(
                        title: UAppStrings.userProfileFriendPage_offline,
                        num: 0,
                      ),
                    ),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = offlineFriendList[index];

                        return Column(
                          children: [
                            if (index == 0)
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: MiniTitleWithNum(
                                  title:
                                      UAppStrings.userProfileFriendPage_offline,
                                  num: offlineFriendList.length,
                                ),
                              ),
                            ContactListTile(
                              name: item.name,
                              status: item.status,
                              statusMessage: item.statusMessage,
                              imageAddress: item.imageAddress,
                              onTap: () {},
                            )
                          ],
                        );
                      },
                      childCount: offlineFriendList.length,
                    ),
                  );
                }
              }
              return SliverToBoxAdapter(
                child: const Center(child: ULoadingIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }
}
