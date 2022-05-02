import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/theme/models/u_themes.dart';

void main() {
  group('Unit Test UThemes class |', () {
    test('Should return correct UThemes type', () {
      expect(UThemes.dark, isA<ThemeData>());
      expect(UThemes.light, isA<ThemeData>());
      expect(UThemes.tbd, isA<ThemeData>());
    });
  });
}
