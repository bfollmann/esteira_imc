import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:esteira_imc/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Calcular IMC', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final weightField = find.byType(TextFormField).first;
      final heightField = find.byType(TextFormField).last;
      final calculateButton = find.byType(ElevatedButton);

      await tester.enterText(weightField, '70');
      await tester.enterText(heightField, '1.75');
      await tester.tap(calculateButton);
      await tester.pumpAndSettle();

      expect(find.text('Seu IMC: 22.86'), findsOneWidget);
      expect(find.text('Categoria: Peso normal'), findsOneWidget);
    });
  });
}