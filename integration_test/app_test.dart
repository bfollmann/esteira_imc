import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:esteira_imc/main.dart' as app; // Import your app's main.dart

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (tester) async {
      app.main(); // Start the app
      await tester.pumpAndSettle();

      // Find the input fields and the button
      final weightField = find.byKey(const Key('weight_field'));
      final heightField = find.byKey(const Key('height_field'));
      final calculateButton = find.byKey(const Key('calculate_button'));

      // Enter values
      await tester.enterText(weightField, '80');
      await tester.enterText(heightField, '1.80');

      // Tap the button
      await tester.tap(calculateButton);
      await tester.pumpAndSettle();

      // Check the result
      expect(find.text('24.69'), findsOneWidget);
      expect(find.text('Normal'), findsOneWidget);
    });
  });
}