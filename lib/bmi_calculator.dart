class BMICalculator {
  double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  String getCategory(double bmi) {
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