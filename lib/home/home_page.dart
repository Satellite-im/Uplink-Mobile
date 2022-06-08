import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/auth_export.dart';
import 'package:uplink/linking_satelittes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _screens = [
    OnboardPinPage(
      key: GlobalKey<NavigatorState>(),
    ),
    LinkingSatellitesPage(
      key: GlobalKey<NavigatorState>(),
    ),
    OnboardPrivacySettingSecondPage(
      key: GlobalKey<NavigatorState>(),
    ),
    LinkingSatellitesPage(
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: CupertinoTabScaffold(
        // body: _screens[_currentIndex],
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
          height: 60,
          backgroundColor: UColors.backgroundDark,
          // type: BottomNavigationBarType.fixed,
          // fixedColor: UColors.backgroundDark,
          // unselectedItemColor: UColors.defGrey,
          currentIndex: _currentIndex,
          onTap: _updateIndex,

          items: [
            BottomNavigationBarItem(
              icon: Center(
                child: UIcon(
                  UIcons.menu_bar_home,
                  color: _currentIndex == 0 ? UColors.ctaBlue : UColors.defGrey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: UIcon(
                UIcons.menu_bar_files,
                color: _currentIndex == 1 ? UColors.ctaBlue : UColors.defGrey,
              ),
            ),
            BottomNavigationBarItem(
              icon: UIcon(
                UIcons.menu_bar_contacts,
                color: _currentIndex == 2 ? UColors.ctaBlue : UColors.defGrey,
              ),
            ),
            const BottomNavigationBarItem(
              icon: UUserProfileWithStatus(
                userProfileSize: UUserProfileSize.topMenuBar,
                status: Status.online,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
