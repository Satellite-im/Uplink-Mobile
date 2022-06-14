// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/models/mock_contact.dart';
import 'package:uplink/contacts/models/triangle.dart';

class BlockedPage extends StatelessWidget {
  const BlockedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: 'Block'),
      body: FutureBuilder(
        future: _loadingContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final contactsList = snapshot.data! as List<MockContact>;

            if (contactsList.isEmpty) {
              return const NoBlockedBody();
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
          onTap: () {
            // TODO(yijing): add block user workflow
          },
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

class _AZItem extends ISuspensionBean {
  _AZItem({required this.contact, required this.tag});

  final MockContact contact;
  final String tag;

  @override
  String getSuspensionTag() => tag;
}

class NoBlockedBody extends StatelessWidget {
  const NoBlockedBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: UText(
        'No one is here, you have 0 blocked contacts!',
        textStyle: UTextStyle.B1_body,
        textColor: UColors.white,
      ),
    );
  }
}

// TODO(yijing): update loading blocked users
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
