import 'package:flutter/cupertino.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/chat_export.dart';
import 'package:uplink/contacts/contacts_export.dart';
import 'package:uplink/file/file_export.dart';
import 'package:uplink/profile/profile_export.dart';
import 'package:uplink/utils/mock/helpers/loading_current_user.dart';
import 'package:uplink/utils/mock/models/mock_current_user.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _currentIndex = 0;
  final _screens = [
    ChatIndexPage(
      key: GlobalKey<NavigatorState>(),
    ),
    FilesIndexPage(
      key: GlobalKey<NavigatorState>(),
    ),
    ContactsIndexPage(
      key: GlobalKey<NavigatorState>(),
    ),
    ProfileIndexPage(
      key: GlobalKey<NavigatorState>(),
    ),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MockCurrentUser?>(
      future: loadingCurrentUser(),
      builder: (context, snapshot) {
        final _mockCurrentUser = snapshot.data;
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: CupertinoTabScaffold(
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: _screens[index],
                  );
                },
              );
            },
            tabBar: CupertinoTabBar(
              height: 80,
              backgroundColor: UColors.backgroundDark,
              currentIndex: _currentIndex,
              onTap: _updateIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Center(
                    child: UIcon(
                      UIcons.menu_bar_home,
                      color: _currentIndex == 0
                          ? UColors.ctaBlue
                          : UColors.defGrey,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: UIcon(
                    UIcons.menu_bar_files,
                    color:
                        _currentIndex == 1 ? UColors.ctaBlue : UColors.defGrey,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: UIcon(
                    UIcons.menu_bar_contacts,
                    color:
                        _currentIndex == 2 ? UColors.ctaBlue : UColors.defGrey,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex == 3
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
                              imagePath: _mockCurrentUser?.imageAddress,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : UUserProfileWithStatus(
                          userProfileSize: UUserProfileSize.topMenuBar,
                          uImage: UImage(
                            imagePath: _mockCurrentUser?.imageAddress,
                            fit: BoxFit.cover,
                          ),
                          status: Status.online,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
