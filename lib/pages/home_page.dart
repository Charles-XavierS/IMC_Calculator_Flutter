import 'package:flutter/material.dart';
import 'package:imc_flutter/pages/calculator_page.dart';
import 'package:imc_flutter/pages/list_page.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int pagePosition = 0;
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
      body: PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              pagePosition = value;
            });
          },
          children: const [Calculator(), ListPage()]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          pageController.jumpToPage(value);
        },
        currentIndex: pagePosition,
        items: const [
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
