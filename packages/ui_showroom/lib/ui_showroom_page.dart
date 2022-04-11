library ui_showroom;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_showroom/ui_pages/ui_pages_export.dart';
import 'package:ui_library/ui_library_export.dart';

class UIShowRoomApp extends StatelessWidget {
  const UIShowRoomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final String themeText = themeProvider.themeMode == ThemeMode.light
            ? 'Light Theme'
            : 'Dark Theme';

        return MaterialApp(
          themeMode: themeProvider.themeMode,
          theme: UThemes.lightTheme,
          darkTheme: UThemes.darkTheme,
          initialRoute: '/',
          routes: {
            UIconPage.routeName: (context) => const UIconPage(),
            UColorsPage.routeName: (context) => const UColorsPage(),
          },
          home: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text('UI Showroom $themeText'),
              actions: const [ChangeThemeButton()],
            ),
            body: Center(
              child: Column(
                children: const [
                  SizedBox.square(
                    dimension: 16,
                  ),
                  WidgetPageButton(
                    widgetName: 'UIcon',
                  ),
                  WidgetPageButton(
                    widgetName: 'UColors',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        value: themeProvider.isLightMode,
        onChanged: (value) {
          final themeMode = Provider.of<ThemeProvider>(context, listen: false);
          themeMode.toggleTheme(value);
        });
  }
}

class WidgetPageButton extends StatelessWidget {
  const WidgetPageButton({Key? key, required this.widgetName})
      : super(key: key);

  final String widgetName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/$widgetName');
      },
      child: Text(widgetName),
    );
  }
}
