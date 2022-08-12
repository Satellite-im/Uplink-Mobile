import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/u_chatbar/u_chatbar.dart';

void main() {
  group('Widget Test UChatBar|', () {
    testWidgets('Should return the right size', (WidgetTester tester) async {
      final _textEditingController = TextEditingController();
      final List<String> _textList = [];

      String _addValue(String value) {
        return value;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Column(children: [
                  UChatbar(
                    textEditingController: _textEditingController,
                    onMsg: (value) {
                      _addValue(value);
                    },
                    onImage: () {
                      _addValue('image');
                    },
                    onSticker: () {
                      _addValue('sticker');
                    },
                    onEmoji: () {
                      _addValue('emoji');
                    },
                    onGif: () {
                      _addValue('gif');
                    },
                  )
                ])
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UChatbar));
      expect(_baseSize.width, equals(800.0));
      expect(_baseSize.height, equals(56.0));
    });
  });
}
