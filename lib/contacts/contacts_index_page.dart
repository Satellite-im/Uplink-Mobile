import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class ContactsIndexPage extends StatefulWidget {
  const ContactsIndexPage({Key? key}) : super(key: key);

  @override
  State<ContactsIndexPage> createState() => _ContactsIndexPageState();
}

class _ContactsIndexPageState extends State<ContactsIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        actionList: [
          IconButton(
            icon: const UIcon(
              UIcons.search,
              color: UColors.textMed,
            ),
            onPressed: () async {},
          ),
          IconButton(
            icon: const UIcon(
              UIcons.add_contact_member,
              color: UColors.textMed,
            ),
            onPressed: () async {},
          ),
          IconButton(
            icon: const UIcon(
              UIcons.hamburger_menu,
              color: UColors.textMed,
            ),
            onPressed: () async {},
          ),
        ],
        leading: IconButton(
          icon: const UIcon(
            UIcons.lefthand_navigation_drawer,
            color: UColors.textMed,
          ),
          onPressed: () async {},
        ),
        title: UAppStrings.contactsIndexPage_appBarTitle,
      ),
      body: FutureBuilder(
        future: _loadingContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final friendList = snapshot.data! as List<Friends>;
            if (friendList.isEmpty) {
              return const NoFriendBody();
            } else {
              return ListView.builder(
                itemBuilder: (context, index) =>
                    Text(friendList[index].toString()),
                itemCount: friendList.length,
              );
            }
          }
          return const Center(child: ULoadingIndicator());
        },
      ),
    );
  }
}

class NoFriendBody extends StatelessWidget {
  const NoFriendBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...const [
            Center(
              child: UText(
                'No Friends Yet',
                textStyle: UTextStyle.H1_primaryHeader,
              ),
            ),
            SizedBox(height: 16),
            UText(
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
              textStyle: UTextStyle.B1_body,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 56),
          ],
          UButton.primary(
            label: 'Add a Friend',
            uIconData: UIcons.add_contact_member,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// TODO(yijing): update loading contacts
Future<List<Friends>> _loadingContacts() async {
  const hasFriends = false;
  if (hasFriends == true) {
    return Future.delayed(const Duration(seconds: 1), () {
      final result = [
        Friends(name: 'test', statusMessage: 'test', isOnline: true),
      ];
      return result;
    });
  }
  return [];
}

class Friends {
  Friends({
    required this.name,
    required this.statusMessage,
    required this.isOnline,
  });
  String name;
  String statusMessage;
  bool isOnline;
}
