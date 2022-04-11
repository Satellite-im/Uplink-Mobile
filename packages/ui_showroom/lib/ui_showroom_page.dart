library ui_showroom;

import 'package:flutter/material.dart';
import 'package:ui_showroom/ui_pages/ui_pages_export.dart';

class UIShowRoomApp extends StatelessWidget {
  const UIShowRoomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        UIconPage.routeName: (context) => const UIconPage(),
        UColorsPage.routeName: (context) => const UColorsPage(),
      },
      home: Scaffold(
        appBar: AppBar(title: const Text('UI Library Show Room')),
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
