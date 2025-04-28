class BMICalculator {
  final double weight;
  final double height;

  BMICalculator({required this.weight, required this.height});

  double calculateBMI() {
    return weight / (height * height);
  }

  String getCategory() {
    double bmi = calculateBMI();
    if (bmi < 18.5) {
      return 'Abaixo do peso';
    } else if (bmi < 25) {
      return 'Peso normal';
    } else if (bmi < 30) {
      return 'Sobrepeso';
    } else {
      return 'Obesidade';
    }
  }
}