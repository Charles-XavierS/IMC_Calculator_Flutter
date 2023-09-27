import 'package:flutter/material.dart';
import '../models/imc_sqlite_model.dart';
import '../repositories/sqlite/imc_sqlite_repository.dart'; // Importe o repositório SQLite

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var imcSqliteRepository = IMCSqliteRepository();
  List<ImcSqliteModel> imcResults = [];

  @override
  void initState() {
    super.initState();
    loadResults();
  }

  Future<void> loadResults() async {
    var results = await imcSqliteRepository.getDataBase();
    setState(() {
      imcResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultados")),
      body: Column(
        children: [
          Expanded(
            child: imcResults.isNotEmpty
                ? ListView.builder(
                    itemCount: imcResults.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var listResult = imcResults[index];
                      return Dismissible(
                        key: Key(listResult.id.toString()),
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
                                            imcSqliteRepository
                                                .delete(listResult.id);
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
                            imcSqliteRepository.delete(listResult.id);
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
                            imcResults[index].imc,
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
