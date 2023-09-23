import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Bem-vindo, ${widget.name}!'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: TextField(
                  keyboardType:
                      TextInputType.number, // Define o teclado numérico
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly, // Permite apenas dígitos (números)
                  ],
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 30),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      labelText: 'Peso (kg)',
                      labelStyle:
                          TextStyle(color: Colors.deepPurple, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.balance,
                        color: Colors.deepPurple,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: TextField(
                  keyboardType:
                      TextInputType.number, // Define o teclado numérico
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly, // Permite apenas dígitos (números)
                  ],
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 30),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      labelText: 'Altura (cm)',
                      labelStyle:
                          TextStyle(color: Colors.deepPurple, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.height,
                        color: Colors.deepPurple,
                      )),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar o cálculo do IMC aqui
              },
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculadora IMC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Resultados',
          ),
        ],
      ),
    );
  }
}
