import 'package:flutter_test/flutter_test.dart';
import 'package:ui_showroom/ui_showroom_page.dart';
import 'package:uplink/app/app.dart';
import 'package:uplink/pages_export.dart';

void main() {
  group('App', () {
    testWidgets('renders First Page', (tester) async {
      await tester.pumpWidget(const App());
      final _mainAppPageOrUIShowroomPage = find.byWidgetPredicate(
        (widget) => widget is OnboardPinPage || widget is UIShowRoomApp,
      );
      expect(_mainAppPageOrUIShowroomPage, findsOneWidget);
    });
  });
}
