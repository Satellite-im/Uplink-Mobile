import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/chat_export.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/contacts_index_page.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/file_index_page.dart';
import 'package:uplink/profile/presentation/controller/current_user_bloc.dart';
import 'package:uplink/profile/profile_export.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/ui_utils/ui_utils_export.dart';

final bottomBarScaffoldStateKey = GlobalKey<ScaffoldState>();

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);
  static const routeName = '/MainBottomNavigationBar';

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _currentIndex = 0;

  final _screens = const [
    ChatIndexPage(),
    FileIndexPage(),
    ContactsIndexPage(),
    ProfileIndexPage(),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
      if (_currentIndex == 1) {
        GetIt.I.get<ItemListBloc>().add(GetItemList());
      } else if (_currentIndex == 2) {
        GetIt.I.get<FriendBloc>().add(ListFriendsStarted());
      }
    });
  }

  final _currentUserController = GetIt.I.get<CurrentUserBloc>();
  final _warpController = GetIt.I.get<WarpBloc>();

  @override
  void initState() {
    super.initState();
    // TODO(yijing): add loading page for this call
    _currentUserController.add(GetCurrentUserInfo());
    _warpController.add(RaygunStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: bottomBarScaffoldStateKey,
      drawer: const SideDrawer(),
      //use IndexedStack to keep the state in every screen
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: UColors.backgroundDark,
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Center(
                child: UIcon(
                  UIcons.menu_bar_home,
                  color: _currentIndex == 0 ? UColors.ctaBlue : UColors.defGrey,
                ),
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: UIcon(
                UIcons.menu_bar_files,
                color: _currentIndex == 1 ? UColors.ctaBlue : UColors.defGrey,
              ),
              label: 'File',
            ),
            BottomNavigationBarItem(
              icon: UIcon(
                UIcons.menu_bar_contacts,
                color: _currentIndex == 2 ? UColors.ctaBlue : UColors.defGrey,
              ),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: BlocBuilder<CurrentUserBloc, CurrentUserState>(
                bloc: _currentUserController,
                builder: (context, state) {
                  if (state is CurrentUserLoadSuccess &&
                      _currentUserController.currentUser?.profilePicture !=
                          null) {
                    return _currentIndex == 3
                        ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: UColors.ctaBlue,
                                width: 2,
                              ),
                            ),
                            child: UUserProfile(
                              userProfileSize: UUserProfileSize.topMenuBar,
                              uImage: UImage(
                                imagePath: _currentUserController
                                    .currentUser?.profilePicture?.path,
                                imageSource: ImageSource.file,
                              ),
                            ),
                          )
                        : UUserProfileWithStatus(
                            userProfileSize: UUserProfileSize.topMenuBar,
                            uImage: UImage(
                              imagePath: _currentUserController
                                  .currentUser?.profilePicture?.path,
                              imageSource: ImageSource.file,
                            ),
                            status: Status.online,
                          );
                  } else {
                    return _currentIndex == 3
                        ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: UColors.ctaBlue,
                                width: 2,
                              ),
                            ),
                            child: const UUserProfile(
                              userProfileSize: UUserProfileSize.topMenuBar,
                              uImage: UImage(),
                            ),
                          )
                        : const UUserProfileWithStatus(
                            userProfileSize: UUserProfileSize.topMenuBar,
                            uImage: UImage(),
                            status: Status.online,
                          );
                  }
                },
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
