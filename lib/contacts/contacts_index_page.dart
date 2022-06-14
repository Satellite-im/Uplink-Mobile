import 'dart:convert';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/blocked_page.dart';
import 'package:uplink/contacts/models/models_export.dart';

class ContactsIndexPage extends StatelessWidget {
  const ContactsIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        title: 'Contacts',
        leading: IconButton(
          icon: const UIcon(
            UIcons.lefthand_navigation_drawer,
            color: UColors.textMed,
          ),
          onPressed: () {},
        ),
        actionList: [
          IconButton(
            onPressed: () {},
            icon: const UIcon(
              UIcons.search,
              color: UColors.textMed,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const UIcon(
              UIcons.add_contact_member,
              color: UColors.textMed,
            ),
          ),
          IconButton(
            onPressed: () {
              UBottomSheetOptions(
                context,
                sheetTitle: 'More Options',
                titleList: ['Friend Requests', 'Outgoing Requests', 'Blocked'],
                // TODO(yijing): update UIcons
                iconList: [UIcons.friend_added, UIcons.about, UIcons.about],
                onTapList: [
                  () {
                    // TODO(yijing): add Friend Requests work flow
                  },
                  () {
                    // TODO(yijing): add Outgoing Requests work flow
                  },
                  () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const BlockedPage(),
                      ),
                    );
                  }
                ],
              ).show();
            },
            icon: const UIcon(
              UIcons.hamburger_menu,
              color: UColors.textMed,
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: _loadingContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final contactsList = snapshot.data! as List<MockContact>;

            if (contactsList.isEmpty) {
              return const NoFriendBody();
            } else {
              //Turn [MockContact] into AZItem(ISuspensionBean)
              //which will be used in AZListView
              final contactsAZList = contactsList
                  .map(
                    (item) =>
                        _AZItem(contact: item, tag: item.name[0].toUpperCase()),
                  )
                  .toList();
              //Besides the initial letter, sort the rest of letter
              SuspensionUtil.sortListBySuspensionTag(contactsAZList);
              //Let each item know if it needs to show tag name above them
              SuspensionUtil.setShowSuspensionStatus(contactsAZList);

              return AzListView(
                data: contactsAZList,
                itemCount: contactsAZList.length,
                itemBuilder: (context, index) {
                  final item = contactsAZList[index];
                  return _buildContactsList(item);
                },
//indexBar is the initial letter on the right
                indexBarMargin: const EdgeInsets.only(right: 8),
                indexBarWidth: 16,
                indexBarOptions: IndexBarOptions(
                  needRebuild: true,
                  textStyle: UTextStyle.B1_body.style.returnTextStyleType(),
                  selectTextStyle: UTextStyle.B3_bold.style.returnTextStyleType(
                    color: Colors.white,
                  ),
                  selectItemDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: UColors.ctaBlue,
                  ),
                  indexHintAlignment: Alignment.centerRight,
                  indexHintOffset: const Offset(20, 16),
                ),
//indexHint is the widget shows when user hold on the indexBar
                indexHintBuilder: (context, hint) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: UColors.ctaBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: UText(
                        hint,
                        textStyle: UTextStyle.H2_secondaryHeader,
                        textColor: UColors.white,
                      ),
                    ),
                    CustomPaint(painter: Triangle()),
                  ],
                ),
              );
            }
          }
          return const Center(child: ULoadingIndicator());
        },
      ),
    );
  }

  Widget _buildContactsList(_AZItem item) {
    final tag = item.getSuspensionTag();
    final offstage = !item.isShowSuspension;
    return Column(
      children: [
        Offstage(offstage: offstage, child: ContactsHeader(tag: tag)),
        ContactListTile(
          name: item.contact.name,
          status: item.contact.status,
          statusMessage: item.contact.statusMessage,
          onTap: () {},
        ),
      ],
    );
  }
}

class _AZItem extends ISuspensionBean {
  _AZItem({required this.contact, required this.tag});

  final MockContact contact;
  final String tag;

  @override
  String getSuspensionTag() => tag;
}

// TODO(yijing): update loading contacts
Future<List<MockContact>> _loadingContacts() async {
  const hasFriends = true;
  if (hasFriends == true) {
    final jsonString = await rootBundle
        .loadString('lib/contacts/models/mock_contact_list.json');
    final list = await jsonDecode(jsonString) as List<dynamic>;

    return list.map(MockContact.fromJson).toList();
  } else {
    return [];
  }
}
