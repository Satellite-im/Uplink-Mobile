import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/widgets_export.dart';
import '../helper/golden_test_widget_page.dart';

void main() {
  group('UButton:Golden Test', () {
    testWidgets(
      'UButton.primary',
      (tester) async {
        await tester.pumpWidget(GoldenTestWidgetPage(
            widget: UButton.primary(
                label: 'UButton.primary',
                uIconData: UIcons.about,
                onPressed: () {})));
        await expectLater(find.byType(UButton),
            matchesGoldenFile('goldens/u_button_primary.png'));
      },
      tags: 'golden',
    );
    testWidgets(
      'UButton.secondary',
      (tester) async {
        await tester.pumpWidget(GoldenTestWidgetPage(
            widget: UButton.secondary(
                label: 'UButton.secondary',
                uIconData: UIcons.about,
                onPressed: () {})));
        await expectLater(find.byType(UButton),
            matchesGoldenFile('goldens/u_button_secondary.png'));
      },
      tags: 'golden',
    );
    testWidgets(
      'UButton.filled1',
      (tester) async {
        await tester.pumpWidget(GoldenTestWidgetPage(
            widget: UButton.filled1(
          label: 'UButton.primary',
          onPressed: () {},
        )));
        await expectLater(find.byType(UButton),
            matchesGoldenFile('goldens/u_button_filled1.png'));
      },
      tags: 'golden',
    );
    testWidgets(
      'UButton.filled2',
      (tester) async {
        await tester.pumpWidget(GoldenTestWidgetPage(
            widget: UButton.filled2(
          label: 'UButton.primary',
          onPressed: () {},
        )));
        await expectLater(find.byType(UButton),
            matchesGoldenFile('goldens/u_button_filled2.png'));
      },
      tags: 'golden',
    );
  });
}
