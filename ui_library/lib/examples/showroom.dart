import 'package:flutter/material.dart';
import 'package:ui_library/examples/all.dart';

class UILibraryShowRoom extends StatelessWidget {
  const UILibraryShowRoom({Key? key}) : super(key: key);

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
                    builder: (context) => const UIconExample(),
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
