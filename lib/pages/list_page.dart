import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/imc_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var imcResultsProvider = Provider.of<IMCResultsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Resultados")),
      body: Column(
        children: [
          Expanded(
            child: imcResultsProvider.imcResults.isNotEmpty
                ? ListView.builder(
                    itemCount: imcResultsProvider.imcResults.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var listResults = imcResultsProvider.imcResults[index];
                      return Dismissible(
                        key: Key(listResults.id),
                        onDismissed: (DismissDirection direction) {
                          // Remova o resultado da lista usando o IMCResultsProvider
                          imcResultsProvider.removeResult(listResults.id);
                        },
                        background: Container(
                          color: Colors.red[900],
                          alignment: Alignment.centerLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 16.0), // Adicionando um espaço
                            child: Icon(
                              Icons.delete_forever,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Colors.red[900],
                          alignment: Alignment.centerRight,
                          child: const Padding(
                            padding: EdgeInsets.only(
                                right: 16.0), // Adicionando um espaço
                            child: Icon(
                              Icons.delete_forever,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            listResults.getImc(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'Sem resultados salvos',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
