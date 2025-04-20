import 'package:flutter_test/flutter_test.dart';

void main() {
  test('O cálculo de IMC está correto', () {
    double weight = 70;
    double height = 1.75;
    double bmi = weight / (height * height);
    expect(bmi.toStringAsFixed(2), '22.86');
  });

  test('A categoria de IMC está correta', () {
    double weight = 70;
    double height = 1.75;
    double bmi = weight / (height * height);
    String category = '';
    if (bmi < 18.5) {
      category = 'Abaixo do peso';
    } else if (bmi < 25) {
      category = 'Peso normal';
    } else if (bmi < 30) {
      category = 'Sobrepeso';
    } else {
      category = 'Obesidade';
    }
    expect(category, 'Peso normal');
  });
}