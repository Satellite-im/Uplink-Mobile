import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_showroom/ui_pages/src/shimmer/loading_pages/loading_contacts_index_page.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/add_friend_page/add_friend_page.dart';
import 'package:uplink/contacts/presentation/view/contacts_export.dart';
import 'package:uplink/contacts/presentation/view/contacts_index_page/helpers/contacts_list_stream.dart';
import 'package:uplink/contacts/presentation/view/models/models_export.dart';
import 'package:uplink/contacts/presentation/view/user_profile_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/ui_utils/bottom_navigation_bar.dart';

class ContactsIndexPage extends StatefulWidget {
  const ContactsIndexPage({Key? key}) : super(key: key);

  @override
  State<ContactsIndexPage> createState() => _ContactsIndexPageState();
}

class _ContactsIndexPageState extends State<ContactsIndexPage> {
  final _friendController = GetIt.I.get<FriendBloc>();
  final _contactsListStream = GetIt.I.get<ContactsListStream>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: _contactsListStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Column(
                children: const [
                  _UAppBar(),
                  Text('Could not load contacts'),
                ],
              );
            } else if (snapshot.hasData) {
              final _contactsList = snapshot.data!;
              if (_contactsList.isEmpty) {
                return Column(
                  children: const [
                    _UAppBar(),
                    Expanded(child: NoFriendBody()),
                  ],
                );
              }

              //Turn [User] into AZItem(ISuspensionBean)
              //which will be used in AZListView
              final contactsAZList = _contactsList
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
            return const LoadingContactsIndexPage();
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
        Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          background: Container(
            color: UColors.termRed,
            padding: const EdgeInsets.only(right: 40),
            alignment: Alignment.centerRight,
            child: const UIcon(
              UIcons.remove,
            ),
          ),
          onDismissed: (direction) =>
              _friendController.add(RemoveFriend(item.contact)),
          confirmDismiss: (direction) {
            return showDialog<bool>(
              context: context,
              builder: (context) {
                return UDialogUserProfile(
                  bodyText: UAppStrings.friendBody_remove_q,
                  buttonText: UAppStrings.remove,
                  buttonColor: UColors.termRed,
                  popButtonText: UAppStrings.goBackButton,
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  username: item.contact.username,
                  uImage: UImage(
                    imagePath: item.contact.profilePicture == null
                        ? ''
                        : item.contact.profilePicture!.path,
                    imageSource: ImageSource.file,
                  ),
                  statusMessage: item.contact.statusMessage,
                );
              },
            );
          },
          child: ContactListTile(
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
              delegate: ContactSearch(),
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
