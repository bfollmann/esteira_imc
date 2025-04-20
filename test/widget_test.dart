import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:esteira_imc/main.dart';

void main() {
  testWidgets('Teste de UI da Calculadora IMC', (WidgetTester tester) async {
    await tester.pumpWidget(BMICalculatorApp());

    expect(find.text('Calculadora IMC'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}