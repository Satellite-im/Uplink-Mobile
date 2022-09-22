import 'dart:developer';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/add_friend_page/presentation/view/widgets/friend_body.dart';
import 'package:uplink/contacts/contacts_export.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/contacts/user_profile_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/mock/helpers/loading_contacts.dart';
import 'package:uplink/utils/ui_utils/bottom_navigation_bar.dart';

class ContactsIndexPage extends StatefulWidget {
  const ContactsIndexPage({Key? key}) : super(key: key);

  @override
  State<ContactsIndexPage> createState() => _ContactsIndexPageState();
}

class _ContactsIndexPageState extends State<ContactsIndexPage> {
  final _friendController = GetIt.I.get<FriendBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FriendBloc, FriendState>(
          bloc: _friendController,
          builder: (context, state) {
            if (_friendController.friendsList.isEmpty) {
              return Column(
                children: const [
                  _UAppBar(),
                  Expanded(child: NoFriendBody()),
                ],
              );
            } else if (_friendController.friendsList.isNotEmpty) {
              //Turn [User] into AZItem(ISuspensionBean)
              //which will be used in AZListView
              final contactsAZList = _friendController.friendsList
                  .map(
                    (item) => _AZItem(
                      contact: item,
                      tag: item.username[0].toUpperCase(),
                    ),
                  )
                  .toList()
                ..sort(
                  ((a, b) => a.contact.username.compareTo(
                        b.contact.username,
                      )),
                );

              //Sort tags include @ and #
              SuspensionUtil.sortListBySuspensionTag(contactsAZList);

              //Let each item know if it needs to show tag name above them
              SuspensionUtil.setShowSuspensionStatus(contactsAZList);

              return AzListView(
                data: contactsAZList,
                itemCount: contactsAZList.length,
                itemBuilder: (context, index) {
                  final item = contactsAZList[index];
                  if (index == 0) {
                    return Column(
                      children: [
                        const _UAppBar(),
                        _buildContactsList(item),
                      ],
                    );
                  }
                  return _buildContactsList(item);
                },
                //indexBar is the initial letter on the right
                indexBarMargin: const EdgeInsets.only(right: 8),
                indexBarWidth: 18,
                indexBarItemHeight: 18,
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
            if (state is FriendLoadFailure) {
              log('Not loaded contacts list');
              return Column(
                children: const [
                  _UAppBar(),
                  Expanded(child: NoFriendBody()),
                ],
              );
            }
            // TODO(yijing): update to standard indicator
            return const Center(child: ULoadingIndicator());
          },
        ),
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
          name: item.contact.username,
          status: item.contact.status ?? Status.offline,
          statusMessage: item.contact.statusMessage,
          imageAddress: item.contact.profilePicture?.path ?? '',
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              useRootNavigator: true,
              builder: (context) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
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
}

class _UAppBar extends StatelessWidget {
  const _UAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UAppBar.actions(
      title: UAppStrings.contactsIndexPage_appBarTitle,
      leading: IconButton(
        icon: const UIcon(
          UIcons.lefthand_navigation_drawer,
          color: UColors.textMed,
        ),
        onPressed: () {
          bottomBarScaffoldStateKey.currentState?.openDrawer();
        },
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
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const AddFriendPage(),
              ),
            );
          },
          icon: const UIcon(
            UIcons.add_contact,
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
    );
  }
}

class _AZItem extends ISuspensionBean {
  _AZItem({required this.contact, required this.tag});

  final User contact;
  final String tag;

  @override
  String getSuspensionTag() => tag;
}
