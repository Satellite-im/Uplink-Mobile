import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/widgets_export.dart';
import '../../helpers/golden_test_widget_page.dart';

void main() {
  testWidgets(
    'ULogoutButton:Golden Test',
    (tester) async {
      await tester.pumpWidget(
          GoldenTestWidgetPage(widget: ULogoutButton(onPressed: () {})));
      await expectLater(find.byType(ULogoutButton),
          matchesGoldenFile('goldens/u_logout_button.png'));
    },
    tags: 'golden',
  );
}
