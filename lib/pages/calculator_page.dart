import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class IMC {
  double calcularIMC(double peso, double altura) {
    double imc = peso / (altura * altura);
    return imc;
  }
}

class _CalculatorState extends State<Calculator> {
  double weight = 60.0;
  double height = 160.0;
  final imcCalculator = IMC();

  double imcResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centralize horizontalmente
              children: [
                Expanded(child: Container()),
                const Icon(
                  Icons.balance,
                  color: Colors.deepPurple,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Peso',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                  ),
                ),
                Expanded(child: Container()),
                const SizedBox(width: 10),
                SizedBox(
                  width: 90,
                  child: Text(
                    '${weight.toStringAsFixed(2)} kg',
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            Slider(
              value: weight,
              min: 20.0,
              max: 300.0,
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 50),
        Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centralize horizontalmente
              children: [
                Expanded(child: Container()),
                const Icon(
                  Icons.height,
                  color: Colors.deepPurple,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Altura',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                  ),
                ),
                Expanded(child: Container()),
                const SizedBox(width: 10),
                SizedBox(
                  width: 100,
                  child: Text(
                    '${height.toStringAsFixed(2)} cm',
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            Slider(
              value: height,
              min: 60.0,
              max: 250.0,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            double imc = imcCalculator.calcularIMC(weight, height / 100.0);
            print(imc.toStringAsFixed(2));
            setState(() {
              imcResult = imc;
            });
          },
          child: const Text(
            'Calcular',
          ),
        ),
      ],
    );
  }
}
