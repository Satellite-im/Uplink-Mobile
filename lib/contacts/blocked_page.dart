// ignore_for_file: lines_longer_than_80_chars

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/contacts/user_profile_page/user_profile_page.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/helpers/loading_contacts.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class BlockedPage extends StatelessWidget {
  const BlockedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: UAppStrings.blockedPage_appBarTitle),
      body: FutureBuilder<List<MockContact>>(
        future: loadingContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final contactsList = snapshot.data!;

            if (contactsList.isEmpty) {
              return const EmptyBody(
                text: UAppStrings.blockedPage_emptyBody,
              );
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
                  return _buildContactsList(item, context);
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
          // TODO(yijing): update to standard indicator
          return const Center(child: ULoadingIndicator());
        },
      ),
    );
  }

  Widget _buildContactsList(_AZItem item, BuildContext context) {
    final tag = item.getSuspensionTag();
    final offstage = !item.isShowSuspension;
    return Column(
      children: [
        Offstage(offstage: offstage, child: _buildHeader(tag)),
        ContactListTile(
          name: item.contact.name,
          status: item.contact.status,
          statusMessage: item.contact.statusMessage,
          imageAddress: item.contact.imageAddress,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) {
                  // TODO(Dev):change user type
                  final user = item.contact.copywith(
                    bannerImageAddress:
                        'lib/utils/mock/images/bannerImage1.png',
                    badgesNum: 5,
                    location: 'State, USA',
                    friendNum: 24,
                    relationship: Relationship.friend,
                    friendRequestSent: true,
                    about:
                        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae beatae vitae dicta sunt explicabo. ',
                  );
                  return UserProfilePage(
                    user: user,
                  );
                },
              ),
            );
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
