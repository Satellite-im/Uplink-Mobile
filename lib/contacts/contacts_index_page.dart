import 'dart:developer';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/contacts_export.dart';
import 'package:uplink/contacts/helpers/loading_contacts.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class ContactsIndexPage extends StatelessWidget {
  const ContactsIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        title: UAppStrings.contactsIndexPage_appBarTitle,
        leading: IconButton(
          icon: const UIcon(
            UIcons.lefthand_navigation_drawer,
            color: UColors.textMed,
          ),
          onPressed: () {},
        ),
        actionList: [
          IconButton(
            onPressed: () {
              showCustomSearch(
                context: context,
                delegate: ContactSearch(loadingContacts()),
              );
            },
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
                sheetTitle: UAppStrings.moreOptions,
                titleList: [
                  UAppStrings.contactsIndexPage_friendRequests,
                  UAppStrings.contactsIndexPage_outgoingRequests,
                  UAppStrings.contactsIndexPage_blocked
                ],
                iconList: [
                  UIcons.friend_requests,
                  UIcons.outgoing_requests,
                  UIcons.blocked_contacts
                ],
                onTapList: [
                  () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const FriendRequestPage(),
                      ),
                    );
                  },
                  () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const OutgoingRequestPage(),
                      ),
                    );
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
        future: loadingContacts(),
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
                  .toList()
                ..sort(((a, b) => a.contact.name.compareTo(b.contact.name)));

              //Sort tags include @ and #
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
                  textStyle: UTextStyle.B1_body.style
                      .returnTextStyleType(color: UColors.textDark),
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
          } else if (snapshot.hasError) {
            log(snapshot.error.toString());
          }
          // TODO(yijing): update to standard indicator
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
          imageAddress: item.contact.imageAddress,
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
