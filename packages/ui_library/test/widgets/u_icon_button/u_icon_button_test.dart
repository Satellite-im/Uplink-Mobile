import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/widgets_export.dart';
import '../helpers/golden_test_widget_page.dart';

void main() {
  group('UIconButton:Golden Test', () {
    testWidgets(
      'UIconButton.add',
      (tester) async {
        await tester.pumpWidget(
            GoldenTestWidgetPage(widget: UIconButton.add(onPressed: () {})));
        await expectLater(find.byType(UIconButton),
            matchesGoldenFile('goldens/u_icon_button_add.png'));
      },
      tags: 'golden',
    );
    testWidgets(
      'UIconButton.call',
      (tester) async {
        await tester.pumpWidget(
            GoldenTestWidgetPage(widget: UIconButton.call(onPressed: () {})));
        await expectLater(find.byType(UIconButton),
            matchesGoldenFile('goldens/u_icon_button_call.png'));
      },
      tags: 'golden',
    );
    testWidgets(
      'UIconButton.chat',
      (tester) async {
        await tester.pumpWidget(
            GoldenTestWidgetPage(widget: UIconButton.chat(onPressed: () {})));
        await expectLater(find.byType(UIconButton),
            matchesGoldenFile('goldens/u_icon_button_chat.png'));
      },
      tags: 'golden',
    );
    testWidgets(
      'UIconButton.end',
      (tester) async {
        await tester.pumpWidget(GoldenTestWidgetPage(
            widget: UIconButton.end(
          onPressed: () {},
        )));
        await expectLater(find.byType(UIconButton),
            matchesGoldenFile('goldens/u_icon_button_end.png'));
      },
      tags: 'golden',
    );

    testWidgets(
      'UIconButton.mute',
      (tester) async {
        await tester.pumpWidget(GoldenTestWidgetPage(
            widget: UIconButton.mute(
          onPressed: () {},
        )));
        await expectLater(find.byType(UIconButton),
            matchesGoldenFile('goldens/u_icon_button_mute.png'));
      },
      tags: 'golden',
    );
    testWidgets(
      'UIconButton.search',
      (tester) async {
        await tester.pumpWidget(GoldenTestWidgetPage(
            widget: UIconButton.search(
          onPressed: () {},
        )));
        await expectLater(find.byType(UIconButton),
            matchesGoldenFile('goldens/u_icon_button_search.png'));
      },
      tags: 'golden',
    );
  });
}
