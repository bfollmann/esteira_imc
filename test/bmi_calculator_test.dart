import 'package:flutter_test/flutter_test.dart';
import 'package:esteira_imc/bmi_calculator.dart';

void main() {
  group('BMICalculator', () {
    test('calculateBMI retorna o valor correto', () {
      final calculator = BMICalculator(weight: 70, height: 1.75);
      expect(calculator.calculateBMI().toStringAsFixed(2), '22.86');
    });

    test('getCategory retorna a categoria correta', () {
      final calculator = BMICalculator(weight: 70, height: 1.75);
      expect(calculator.getCategory(), 'Peso normal');
    });

    test('getCategory retorna "Abaixo do peso" para IMC < 18.5', () {
      final calculator = BMICalculator(weight: 50, height: 1.75);
      expect(calculator.getCategory(), 'Abaixo do peso');
    });

    test('getCategory retorna "Sobrepeso" para IMC >= 25 e < 30', () {
      final calculator = BMICalculator(weight: 80, height: 1.75);
      expect(calculator.getCategory(), 'Sobrepeso');
    });

    test('getCategory retorna "Obesidade" para IMC >= 30', () {
      final calculator = BMICalculator(weight: 100, height: 1.75);
      expect(calculator.getCategory(), 'Obesidade');
    });
  });
}