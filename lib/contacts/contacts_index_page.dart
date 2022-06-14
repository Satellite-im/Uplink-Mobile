// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/models/mock_contact.dart';

class ContactsIndexPage extends StatefulWidget {
  const ContactsIndexPage({Key? key}) : super(key: key);

  @override
  State<ContactsIndexPage> createState() => _ContactsIndexPageState();
}

class _ContactsIndexPageState extends State<ContactsIndexPage> {
  @override
  void initState() {
    super.initState();
  }

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
                  () {}
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
        Offstage(offstage: offstage, child: _buildHeader(tag)),
        ListTile(
          tileColor: Colors.transparent,
          leading: UUserProfileWithStatus(
            userProfileSize: UUserProfileSize.normal,
            status: item.contact.status,
          ),
          horizontalTitleGap: 12,
          title: UText(
            item.contact.name,
            textStyle: UTextStyle.H4_fourthHeader,
          ),
          subtitle: UText(
            item.contact.statusMessage ?? '',
            textStyle: UTextStyle.B1_body,
            textColor: UColors.textMed,
          ),
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ],
    );
  }

  Widget _buildHeader(String tag) => Container(
        height: 20,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 16),
        padding: const EdgeInsets.only(left: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(4),
          ),
          color: UColors.foregroundDark,
        ),
        child: UText(tag, textStyle: UTextStyle.H3_tertiaryHeader),
      );
}

class Triangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = UColors.ctaBlue;

    final path = Path()
      ..lineTo(0, -8)
      ..lineTo(8, 0)
      ..lineTo(0, 8);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _AZItem extends ISuspensionBean {
  _AZItem({required this.contact, required this.tag});

  final MockContact contact;
  final String tag;

  @override
  String getSuspensionTag() => tag;
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
            onPressed: () {
              // TODO(yijing): add friends pages
            },
          ),
        ],
      ),
    );
  }
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
