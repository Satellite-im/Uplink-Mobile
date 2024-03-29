import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/core/core_export.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/app/view/main_app.dart';
import 'package:uplink/auth/presentation/view/view_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/view/view_export.dart';
import 'package:uplink/utils/ui_utils/bottom_navigation_bar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<void>(
          builder: (context) {
            final themeData = context.watch<ThemeModel>().getThemeData;
            return MainApp(themeData: themeData);
          },
        );
      case OnboardCreateAccountPage.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardCreateAccountPage(),
        );
      case OnboardImportAccountPage.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardImportAccountPage(),
        );
      case OnboardRecoverySeedPage.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardRecoverySeedPage(),
        );
      case OnboardPrivacySettingFirstPage.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardPrivacySettingFirstPage(),
        );
      case OnboardPrivacySettingSecondPage.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardPrivacySettingSecondPage(),
        );
      case OnboardCreateProfilePage.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardCreateProfilePage(),
        );
      case MainBottomNavigationBar.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const MainBottomNavigationBar(),
        );
// File
      case NameFilePage.routeName:
        final _arg = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute<void>(
          builder: (context) => NameFilePage(
            item: _arg?['item'] as Item?,
            isRename: _arg?['isRename'] as bool?,
          ),
        );
      case PhotoDetailPage.routeName:
        final _arg = settings.arguments! as Item;
        return MaterialPageRoute<void>(
          builder: (context) => PhotoDetailPage(
            item: _arg,
          ),
        );
      case FavoritesListPage.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const FavoritesListPage(),
        );
      case RemoveListPage.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const RemoveListPage(),
        );

      default:
        // TODO(yijing): improve error page
        return MaterialPageRoute<void>(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: const Center(child: Text('This page does not exist')),
            );
          },
        );
    }
  }
}
