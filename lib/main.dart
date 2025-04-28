import 'package:flutter/material.dart';
import 'bmi_calculator.dart'; // Import the BMICalculator class

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  double _bmi = 0;
  String _category = '';
  final BMICalculator _bmiCalculator = BMICalculator(); // Create an instance of BMICalculator

  void _calculateBMI() {
    if (_formKey.currentState!.validate()) {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      setState(() {
        _bmi = _bmiCalculator.calculateBMI(weight, height); // Use the BMICalculator instance
        _category = _bmiCalculator.getCategory(_bmi); // Use the BMICalculator instance
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                key: const Key('weightField'), // Added Key
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe seu peso';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: const Key('heightField'), // Added Key
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Altura (m)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe sua altura';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                key: const Key('calculateButton'), // Added Key
                onPressed: _calculateBMI,
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 20),
              Text('Seu IMC: ${_bmi.toStringAsFixed(2)}'),
              Text('Categoria: $_category'),
            ],
          ),
        ),
      ),
    );
  }
}