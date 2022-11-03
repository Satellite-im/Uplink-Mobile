// ignore_for_file: lines_longer_than_80_chars, unused_import

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/models/models_export.dart';
import 'package:uplink/contacts/presentation/view/user_profile_page/models/user_profile_bottom_sheet.dart';
import 'package:uplink/contacts/presentation/view/user_profile_page/user_profile_page.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class BlockedPage extends StatefulWidget {
  const BlockedPage({Key? key}) : super(key: key);

  @override
  State<BlockedPage> createState() => _BlockedPageState();
}

class _BlockedPageState extends State<BlockedPage> {
  final _friendController = GetIt.I.get<FriendBloc>();

  @override
  void initState() {
    super.initState();
    _friendController.add(ListBlockedUsersStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: UAppStrings.blockedPage_appBarTitle),
      body: BlocBuilder<FriendBloc, FriendState>(
        bloc: _friendController,
        builder: (context, state) {
          if (state is FriendLoadSuccess &&
              _friendController.blockedUsersList.isNotEmpty) {
            final contactsList = _friendController.blockedUsersList;

            final contactsAZList = contactsList
                .map(
                  (item) => _AZItem(
                    contact: item,
                    tag: item.username[0].toUpperCase(),
                  ),
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
          } else if (state is FriendLoadInProgress) {
            // TODO(yijing): update to standard indicator
            return const Center(child: ULoadingIndicator());
          } else {
            return const EmptyBody(
              text: UAppStrings.blockedPage_emptyBody,
            );
          }
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
          name: item.contact.username,
          status: item.contact.status ?? Status.offline,
          statusMessage: item.contact.statusMessage,
          imageAddress: item.contact.profilePicture?.path,
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              useRootNavigator: true,
              builder: (context) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                //close the sheet when the outside is tapped
                child: GestureDetector(
                  onTap: () {},
                  child: UserProfileBottomSheet(user: item.contact),
                ),
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

  final User contact;
  final String tag;

  @override
  String getSuspensionTag() => tag;
}
