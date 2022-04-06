import 'package:flutter_test/flutter_test.dart';
import 'package:ui_showroom/ui_showroom_page.dart';
import 'package:uplink/app/app.dart';
import 'package:uplink/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      final _initialPageOrShowroom = find.byWidgetPredicate(
        (widget) => widget is CounterPage || widget is UIShowRoomPage,
      );
      expect(_initialPageOrShowroom, findsOneWidget);
    });
  });
}
