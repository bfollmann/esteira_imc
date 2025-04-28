import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:esteira_imc/main.dart'; // Import your app's main.dart

void main() {
  testWidgets('Calculate BMI and check category', (tester) async {
    // Load the entire app
    await tester.pumpWidget(const BMICalculatorApp());
    await tester.pumpAndSettle();

    // Find the input fields and the button
    final weightField = find.byKey(const Key('weightField')); // Corrected key
    final heightField = find.byKey(const Key('heightField')); // Corrected key
    final calculateButton = find.byKey(const Key('calculateButton')); // Corrected key

    // Enter values
    await tester.enterText(weightField, '80');
    await tester.enterText(heightField, '1.80');

    // Tap the button
    await tester.tap(calculateButton);
    await tester.pumpAndSettle();

    // Check the result
    expect(find.text('Seu IMC: 24.69'), findsOneWidget); // Corrected text
    expect(find.text('Categoria: Peso normal'), findsOneWidget); // Corrected text
  });
}