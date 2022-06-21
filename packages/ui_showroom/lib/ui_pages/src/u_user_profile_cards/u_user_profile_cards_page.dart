import 'package:ui_library/ui_library_export.dart';
import 'package:flutter/material.dart';

part 'models/nav_drawer_card_session.dart';
part 'models/user_profile_card_session.dart';
part 'models/unread_messages_card_session.dart';

class UUserProfileCardsPage extends StatelessWidget {
  const UUserProfileCardsPage({Key? key}) : super(key: key);

  static const routeName = '/UUserProfileCards';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.shortestSide,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox.square(
                  dimension: 16,
                ),
                _NavDrawerUserProfileCard(),
                _UserProfileCard(),
                _UnreadMessagesUserProfileCardSession(),
                SizedBox.square(
                  dimension: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
