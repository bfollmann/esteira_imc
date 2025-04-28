import 'package:flutter_test/flutter_test.dart';
import 'package:esteira_imc/bmi_calculator.dart'; // Import the BMICalculator class

void main() {
  group('BMICalculator', () {
    test('calculateBMI should return the correct BMI', () {
      final calculator = BMICalculator();
      final bmi = calculator.calculateBMI(70, 1.75);
      expect(bmi, closeTo(22.86, 0.01));
    });

    test('getCategory should return the correct category', () {
      final calculator = BMICalculator();
      expect(calculator.getCategory(18.0), 'Abaixo do peso');
      expect(calculator.getCategory(22.86), 'Peso normal');
      expect(calculator.getCategory(27.0), 'Sobrepeso');
      expect(calculator.getCategory(35.0), 'Obesidade');
    });
  });
}