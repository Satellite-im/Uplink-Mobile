// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/user_profile_page/models/models_export.dart';
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
                      UserGroupedInfo(user: user),
                      const SizedBox.square(
                        dimension: 24,
                      ),
                      const UDivider(),
                      const SizedBox.square(
                        dimension: 16,
                      ),
                      UserAbout(user: user),
                      const SizedBox.square(
                        dimension: 24,
                      ),
                      // TODO(yijing): add note function
                      UserNote(),
                      UserLinkedAccounts(),
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
