import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/u_themes/u_themes.dart';

void main() {
  test('Test UThemes class', () {
    expect(UThemes.dark, isA<ThemeData>());
    expect(UThemes.light, isA<ThemeData>());
    expect(UThemes.tbd, isA<ThemeData>());
  });
}
