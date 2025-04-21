import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Removed const here
      title: 'Calculadora IMC',
      theme: ThemeData( // No const here
        primarySwatch: Colors.blue,
      ),
      home: const BMICalculatorScreen(), // Added const here
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

  void _calculateBMI() {
    if (_formKey.currentState!.validate()) {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      setState(() {
        _bmi = weight / (height * height);
        if (_bmi < 18.5) {
          _category = 'Abaixo do peso';
        } else if (_bmi < 25) {
          _category = 'Peso normal';
        } else if (_bmi < 30) {
          _category = 'Sobrepeso';
        } else {
          _category = 'Obesidade';
        }
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