import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/chat_export.dart';
import 'package:uplink/contacts/contacts_export.dart';
import 'package:uplink/file/file_export.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
import 'package:uplink/profile/profile_export.dart';

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

  final _controller = GetIt.I.get<CurrentUserBloc>();

  @override
  void initState() {
    super.initState();
    // TODO(yijing): add loading page for this call
    _controller.add(GetCurrentUserInfo());
  }

  @override
  Widget build(BuildContext context) {
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
            BottomNavigationBarItem(
              icon: BlocBuilder<CurrentUserBloc, CurrentUserState>(
                bloc: _controller,
                builder: (context, state) {
                  if (state is CurrentUserLoadSuccess &&
                      _controller.currentUser?.profilePicture != null) {
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
                                imagePath: _controller
                                    .currentUser?.profilePicture?.path,
                                imageSource: ImageSource.file,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : UUserProfileWithStatus(
                            userProfileSize: UUserProfileSize.topMenuBar,
                            uImage: UImage(
                              imagePath:
                                  _controller.currentUser?.profilePicture?.path,
                              fit: BoxFit.cover,
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
            ),
          ],
        ),
      ),
    );
  }
}
