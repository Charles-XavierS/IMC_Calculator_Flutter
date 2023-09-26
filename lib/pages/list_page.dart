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
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext bc) {
                              return AlertDialog(
                                title: const Text(
                                  'Excluir resultado?',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                content: const Text(
                                  'Essa ação é permanente e não pode ser desfeita',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },
                                          child: const Text(
                                            "Cancelar",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            imcResultsProvider
                                                .removeResult(listResults.id);
                                            Navigator.pop(context, true);
                                          },
                                          child: const Text(
                                            "Excluir",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
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
                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.endToStart) {
                            imcResultsProvider.removeResult(listResults.id);
                          }
                        },
                        background: Container(
                          color: Colors.red[900],
                          alignment: Alignment.centerLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 16.0),
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
                            padding: EdgeInsets.only(right: 16.0),
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
