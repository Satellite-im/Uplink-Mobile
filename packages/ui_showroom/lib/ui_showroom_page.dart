library ui_showroom;

import 'package:flutter/material.dart';

import 'ui_pages/src/u_icon_page.dart';

class UIShowRoomPage extends StatelessWidget {
  const UIShowRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Library Show Room')),
      body: Center(
        child: Column(
          children: [
            const SizedBox.square(
              dimension: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UIconPage(),
                  ),
                );
              },
              child: const Text('UIcon'),
            ),
          ],
        ),
      ),
    );
  }
}
