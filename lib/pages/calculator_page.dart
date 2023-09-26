import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/imc_model.dart';
import '../provider/imc_provider.dart';
import '../repositories/imc_repository.dart';
import '../shared/imc_calculations.dart';

class Calculator extends StatefulWidget {
  const Calculator({
    super.key,
  });

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var imcRepository = IMCRepository();
  double weight = 60.0;
  double height = 1.60;

  @override
  Widget build(BuildContext context) {
    var imcResultsProvider =
        Provider.of<IMCResultsProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Container()),
                const Row(
                  children: [
                    Icon(
                      Icons.balance,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Peso',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      '${weight.toStringAsFixed(2)} kg',
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
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
                  MainAxisAlignment.center,
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
                    '${height.toStringAsFixed(2)} m',
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
              min: 0.60,
              max: 2.50,
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
          onPressed: () async {
            var imc = IMC().calcularIMC(weight, height);
            var imcFinal = IMC().interpretarIMC(imc);
            var imcResult = IMCResult(imcFinal);
            showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text(
                    'Resultado',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  content: Text(
                    imcFinal,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancelar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              imcResultsProvider.addResult(
                                  imcResult);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Salvar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            );
          },
          child: const Text(
            'Calcular',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
