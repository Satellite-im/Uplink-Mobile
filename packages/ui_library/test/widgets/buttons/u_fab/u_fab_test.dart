import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/widgets_export.dart';
import '../../helpers/golden_test_widget_page.dart';

void main() {
  group('UFAB:Golden Test', () {
    testWidgets(
      'UFAB.android',
      (tester) async {
        await tester.pumpWidget(
            GoldenTestWidgetPage(widget: UFAB.android(onPressed: () {})));
        await expectLater(
            find.byType(UFAB), matchesGoldenFile('goldens/u_fab_android.png'));
      },
      tags: 'golden',
    );
    testWidgets(
      'UFAB.ios',
      (tester) async {
        await tester.pumpWidget(
            GoldenTestWidgetPage(widget: UFAB.ios(onPressed: () {})));
        await expectLater(
            find.byType(UFAB), matchesGoldenFile('goldens/u_fab_ios.png'));
      },
      tags: 'golden',
    );
    testWidgets(
      'UFAB.large',
      (tester) async {
        await tester.pumpWidget(
            GoldenTestWidgetPage(widget: UFAB.large(onPressed: () {})));
        await expectLater(
            find.byType(UFAB), matchesGoldenFile('goldens/u_fab_big.png'));
      },
      tags: 'golden',
    );
  });
}
