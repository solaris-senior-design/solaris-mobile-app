import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:solaris_mobile_app/widgets/get_started_button.dart';
import 'package:solaris_mobile_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('wait through splash screen, tap get started, and view metrics',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('solaris'), findsWidgets);
      expect(find.text('the sun at the palm of your hands'), findsWidgets);

      await tester.tap(find.byType(GetStartedButton));

      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('Metrics'), findsWidgets);
      expect(find.text('Voltage'), findsWidgets);
      expect(find.text('Current'), findsWidgets);
      expect(find.text('Temperature'), findsWidgets);
    });
  });
}
