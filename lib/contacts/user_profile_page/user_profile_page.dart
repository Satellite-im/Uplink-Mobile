import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/user_profile_page/models/models_export.dart';
import 'package:uplink/utils/mock/data/data_export.dart';
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

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
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
                CTAButton(
                  user: user,
                ),
                const SizedBox.square(
                  dimension: 16,
                ),
                UserGroupedInfo(user: user),
                const SizedBox.square(
                  dimension: 24,
                ),
              ]),
            ),
          ),
          const SliverToBoxAdapter(
            child: UDivider(height: 1),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox.square(
                  dimension: 16,
                ),
                UserAbout(user: user),
                const SizedBox.square(
                  dimension: 24,
                ),
                // TODO(yijing): add note function
                const UserNote(),
              ]),
            ),
          ),
          if (linkedAccountsList.isNotEmpty && user.isBlocked == false)
            const SliverToBoxAdapter(
              child: UDivider(height: 1),
            ),
          if (user.isBlocked == false)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return UserLinkedAccount(
                    networkUsername:
                        linkedAccountsList[index]['username'] as String,
                    networkProfile:
                        linkedAccountsList[index]['network'] as NetworkProfiles,
                  );
                },
                childCount: linkedAccountsList.length,
              ),
            )
        ],
      ),
    );
  }
}
