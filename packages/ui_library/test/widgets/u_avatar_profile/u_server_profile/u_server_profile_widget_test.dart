import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/u_avatars_profile/u_server_profile/u_server_profile.dart';

void main() {
  group('Widget Test UServerProfile |', () {
    testWidgets('Should return the right size value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      UServerProfile(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UServerProfile));
      expect(_baseSize.width, equals(40.0));
      expect(_baseSize.height, equals(40.0));
    });
  });
  group('Widget Test UServerProfile with null imagePath |', () {
    testWidgets('Should return the right size value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      UServerProfile(
                        imagePath: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UServerProfile));
      final _container = find.byWidgetPredicate(
        ((widget) => (widget is ClipOval && widget.child != null)),
      );

      expect(_container, findsOneWidget);

      expect(_baseSize.width, equals(40.0));
      expect(_baseSize.height, equals(40.0));
    });
  });
  group('Widget Test UServerProfile with custom imagePath |', () {
    const _imageFromNetwork = 'https://satellite.im/images/logo.webp';
    HttpOverrides.global = null;

    testWidgets('Should return the right size value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      UServerProfile(
                        imagePath: _imageFromNetwork,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UServerProfile));
      final _container = find.byWidgetPredicate(
        ((widget) => (widget is ClipOval && widget.child != null)),
      );

      expect(_container, findsOneWidget);

      expect(_baseSize.width, equals(40.0));
      expect(_baseSize.height, equals(40.0));
    });
  });
}
